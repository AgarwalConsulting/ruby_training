# Advanced

## [Bank Account](https://github.com/AgarwalConsulting/ruby_training/tree/master/exercises/bank-accounts)

You are given a list of all the transactions on a bank account during the year `2020`. The account was empty at the beginning of the year (the balance was 0).

Each transaction specifies the amount and the date it was executed. If the amount is negative (i.e. less than 0) then it was a card payment, otherwise it was an incoming transfer (amount at least 0). The date of each transaction is in `YYYY-MM-DD` format: for example, `2020-05-20` represents 20th May 2020.

Additionally, there is a fee for having a card (omitted in the given transaction list), which is 5 per month. This fee is deducted from the account balance at the end of each month unless there were at least `three` payments made by card for a total cost of at least `100` within that month.

Your task is to compute the final balance of the account at the end of the year `2020`.

## [Travel Photos](https://github.com/AgarwalConsulting/ruby_training/tree/master/exercises/travel-photos)

John likes to travel. He has visited a lot of cities over many years. Whenever he visits a city, he takes a few photos and saves them on his computer.

Each photo has a name with an extension ("jpg", "png", or "jpeg") and there is a record of the name of the city where the photo was taken and the time and date the photo; for example: "photo.jpg, Warsaw, 2013-09-05 14:08:15".

Note that, in some rare cases, photos from different locations may share the time and date, due to timezone differences.

John notices that his way of filing photos on his computer has become a mess. He wants to reorganize the photos. First he decides to group the photos by city, then within each such group, sort the photos by the time they were taken and finally assign consecutive natural numbers to the photos, starting from 1. Afterwards he intends to rename all the photos. The new name of each photo should begin with the name of the city followed by the number already assigned to that photo. The number of every photo in each group should have the same length (equal to the length of the largest number in this group); thus, John needs to add some leading zeros to the numbers. The new name of the photo should end with the extension, which should remain the same.

Your task is to help John by finding the new name of each photo.

Each of John's photos has the format: `<<photoname>>.<<extension>>, <<city_name>>, yyyy-mm-dd hh:mm:ss`, where "photoname", "extension" & "city_name" consist only of letters of the English alphabet and supply the name of the photo, the file name extension & the city name, respectively. Be aware that the names of the photos may not be unique.
