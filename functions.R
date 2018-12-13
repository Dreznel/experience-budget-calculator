get_encounter_multiplier_by_num_monsters <- function(number_of_monsters) {
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

get_encounter_multiplier <- function(multiplier_rank, number_of_players) {
  adjusted_multiplier_rank <- get_adjusted_multiplier_rank(multiplier_rank, number_of_players)
  if (adjusted_multiplier_rank == 0) {
    return(0.5)
  } else if (adjusted_multiplier_rank == 1) {
    return(1.0)
  } else if (adjusted_multiplier_rank == 2) {
    return(1.5)
  } else if (adjusted_multiplier_rank == 3) {
    return(2.0)
  } else if (adjusted_multiplier_rank == 4) {
    return(2.5)
  } else if (adjusted_multiplier_rank == 5) {
    return(3.0)
  } else if (adjusted_multiplier_rank == 6) {
    return(4.0)
  } else if (adjusted_multiplier_rank == 7) {
    return(5.0)
  } else {
    return(NULL)
  }
  
  # I wanted to use a switch to make this work so I could learn, but if-else statements are just the right call.
  # return(
  #     switch(
  #     get_adjusted_multiplier_rank(multiplier_rank, number_of_players),
  #     1.0, # 1
  #     1.5, # 2 
  #     2.0, # 3
  #     2.5, # 4
  #     3.0, # 5
  #     4.0  # 6
  #   )
  # )
}

get_adjusted_multiplier_rank <- function(multiplier_rank, number_of_players) {
  
  adjusted_multiplier_rank <- multiplier_rank
  
  if (
    number_of_players < 3 
  ) 
  {
    adjusted_multiplier_rank <- adjusted_multiplier_rank + 1
  }
  else if (
    number_of_players > 5
  ) 
  {
    adjusted_multiplier_rank <- adjusted_multiplier_rank - 1
  } 
  
  return(adjusted_multiplier_rank)
}