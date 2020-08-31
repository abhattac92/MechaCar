library(qwraps2)

cars = read.csv("MechaCar_mpg.csv", header=TRUE)
summary(lm(mpg ~ vehicle.length + vehicle.weight + spoiler.angle + ground.clearance + AWD,data = cars)) #create linear model

coils = read.csv("Suspension_Coil.csv")

our_summary1 <-
  list("PSI" =
         list("min" = ~ min(.data$PSI),
              "max" = ~ max(.data$PSI),
              "variance" = ~ var(.data$PSI),
              "mean (sd)" = ~ qwraps2::mean_sd(.data$PSI))
  
  )

whole <- summary_table(coils, our_summary1)

t.test(coils$PSI, mu = 1500)