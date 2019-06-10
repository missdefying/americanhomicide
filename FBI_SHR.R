
library(readr)
library(dplyr)
library(tidyr)
library(magrittr)
library(ggplot2)
library(reshape2)

data <- read_csv("~/Box Sync/Research/Murder in America/data/FBI_SHR_FOIA.csv")

masskills <- data %>%
  filter(VicCount > 3 & Homicide == 'Murder and non-negligent manslaughter' &
           Weapon %in% c("Fire","Explosives","Firearm, type not stated","Handgun - pistol, revolver, etc",
                                         "Other gun","Rifle","Shotgun"))
         
masskills$method <- masskills$Weapon
masskills$method[masskills$Weapon %in% c("Fire","Explosives")] <- "Fire / Explosives"
masskills$method[masskills$Weapon %in% c("Firearm, type not stated","Handgun - pistol, revolver, etc",
                                         "Other gun","Rifle","Shotgun")] <- "Firearms"

#sandyhook <- data %>%
 # filter(State == 'Connecticut' & Year == '2012' & Month == 'December' & VicCount > 0)


weaponYear <- as.data.frame(table(masskills$method, masskills$Year))
weapon <- dcast(data = weaponYear, Var2 ~ Var1)

names(weaponYear) = c("Weapon","Year","Deaths")

cor(weapon$`Fire / Explosives`, weapon$Firearms)
# -0.2370637  weak negative

ggplot(data = weaponYear, aes(x = Year, y= Deaths, group = Weapon)) +
  geom_line(aes(color = Weapon)) +
  geom_point()
