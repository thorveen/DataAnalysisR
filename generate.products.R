#
#
#
n.batch <- c(1:50)
n.pieces <- c(1:10)
people <- c("Nora", "Thor", "Jimmy")



# let's make a data set
names.col <- c("batch", "unique.ID", "person.1", "person.2", "temp", "defect")


all.data <- as.data.frame(matrix(NA, nrow = 1,
                                 ncol = length(names.col)))
head(all.data)
colnames(all.data) <- names.col
#all.data$unique.ID <- as.character(all.data$unique.ID)
#all.data$person.1 <- as.character(all.data$person.1)
#all.data$person.2 <- as.character(all.data$person.2)



# defects for different variables
# define which variable determines the defect
var.defect <- "temp"

# people
defect.normal <- 0.1
defect.high <- c(0.9)
defect.person <- "Thor"

# temperature
# assume failure rate higher with lower temps
# min and max temp below /above which you have high prob success or failure
# we assume high temp = more failure (coded as a 1)
temp.bad.good <- c(200, 300)



for(i in 1:length(n.batch)){
  
# i <- 1
  name.batch.t <- rep(n.batch[i], length(n.pieces))
  unique.ID.t <- paste( rep(n.batch[i], length(n.pieces)), n.pieces, sep = "." )
  people.t <- sample(people, 2)
  person.1.t <- rep(people.t[1], length(n.pieces))
  person.2.t <- rep(people.t[2], length(n.pieces))
  
  # make temp
  temp.t <- rep(round(runif(1, temp.bad.good[1], temp.bad.good[2]),2), 
                length(n.pieces)) 
  
  # ----add defects linked with specific variable
  
  if(var.defect == "temp"){
    # determine probability defect
    # what is temperate range?
    temp.range <- temp.bad.good[2] -  temp.bad.good[1]
    prob.fail <- (temp.t[1] - temp.bad.good[1])/temp.range
    # draw defects from
    defect.t <- rbinom(length(n.pieces), size = 1, prob.fail)
  }
  
  if(var.defect == "person"){
      # let's add a defect based on the person
      # if thor is involved, defect rates goes to person.defect
      if(people.t[1] == defect.person || people.t[2] == defect.person){
        # persin is the 'defect person' so high faillure rate
        defect.t <- rbinom(length(n.pieces), size = 1, defect.high)
      }else{
        # person of interest is not in the 
        defect.t <- rbinom(length(n.pieces), size = 1, defect.normal)
      }
  }
  
  # turn this into data frame
  data.t <- cbind.data.frame(name.batch.t, unique.ID.t,person.1.t, person.2.t,
                             temp.t, defect.t)
  colnames(data.t) <- names.col
  
  # let's put this into the big data frame all.data
  all.data <- rbind.data.frame(all.data, data.t)
  
}

str(all.data)

# ---- analyse the data -----
#
#

model <- glm(defect ~ temp, family=binomial(link='logit'), data=all.data)
summary(model)






