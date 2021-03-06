#' reading images with facies
#' the files must be .bmp with values 0 and 255
#'

library("bmp")

reading_facies_images<-function(images){

  dimension<-dim(read.bmp(system.file("extdata", images[1], package = "TransPGS")))
  facies <-matrix(0L,dimension[1],dimension[2])
  for ( i in 1:length(images)){
    f<-read.bmp(system.file("extdata", images[i], package = "TransPGS"))
    facies[f != 0]<-i
  }
  # assign NA values
  facies[facies == 0]<- NA

  return(facies)
}
