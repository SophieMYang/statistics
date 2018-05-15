loadRData <- function (filename){
    load(filename)
    get(ls()[ls() != 'filename'])
}
