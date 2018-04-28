BEGIN \
{
	level= 3
	col = 0
	print "Section        |SubSection     |Seq |Column        |Description"
	print "---------------|---------------|----|--------------|-----------"
}

$0 !~ /:/ && level == 3 \
{
		level = 1
		header1 = $0
		header2 = ""
}

$0 !~ /:/ && header1 != $0 \
{
		level = 2
		header2 = $0
}

$0 ~ /:/ \
{
		level = 3
		col += 1
		split($0,arr,": ")
		print header1 "|" header2 "|" col "|"arr[1]"|"arr[2]
}

