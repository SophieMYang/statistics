NR == 1 \
{
	print "Section or Module|Seq|Column|CodeBook|Description"
	print "---------------------------------------------------------|---|---------|--------|-----------------------------------------------------"	
}


$0 ~ /(Section|Module) [0-9]+/ \
{
	gsub(/Main Survey - /,"")
	gsub(/Optional /,"")
	Label=$0
}
$0 ~ /:/ \
	{
		seq += 1
		split($0,arr,":")
		column=substr($0,1,1) == "_" ? "X" arr[1] : arr[1]
	  codebook=arr[1]
	  description=arr[2]
    print(Label "|" seq "|" column "|" codebook "|" description)
	}