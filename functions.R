get_encounter_multiplier <- function(number_of_monsters) {
  if (number_of_monsters == 1) {
    return(1.0)
  } else if (number_of_monsters  == 2) {
    return(1.5)
  } else if (number_of_monsters <= 6) {
    return(2.0)
  } else if (number_of_monsters <= 10) {
    return(2.5)
  } else if (number_of_monsters <= 14) {
    return(3)
  } else {
    return(4)
  }
}