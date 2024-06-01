## Problem 1 (SED) (Filter)

Write a SED script to print the domain names of email from the standard input.

Note: Domain name in an email address is anything which comes after '@'. e.g. in ashok@somemail.com the @somemail.com is the domain name.

**Sample input**

```bash
Mehta,1-322-248-9102,mehta@yahoo.net,Daman and Diu
Malik,1-335-746-5592,malik@hotmail.com,Andhra Pradesh
Suri,1-134-516-1754,suri@protonmail.org,Lakshadweep
Persaud,268-1152,persaud302@aol.co.uk,Dadra and Nagar Haveli
Joshi,1-869-326-6582,joshi4288@hotmail.com,OR
Subram,1-172-433-4318,subram@hotmail.edu,MH
Sehgal,647-1701,sehgal@outlook.co.uk,DD
```

**Sample output**

```bash
yahoo.net
hotmail.com
protonmail.org
aol.co.uk
hotmail.com
hotmail.edu
outlook.co.uk
```

### Prefix

```bash
script() { echo '#!/bin/sed -f
```

### Suffix

```bash
'
}
```

### Invisible code

```bash
DIR=$RANDOM
while [ -d "$DIR" ]; do
  DIR=$RANDOM
done
mkdir -p "$DIR" &> /dev/null
cd "$DIR"

script > script.sed
cat | sed -f script.sed 2>&1
```

### Solution

```bash
s/.*@//
s/,.*//
```

### Test cases

#### Public

##### Input 1

```
Mehta,1-322-248-9102,mehta@yahoo.net,Daman and Diu
Malik,1-335-746-5592,malik@hotmail.com,Andhra Pradesh
Suri,1-134-516-1754,suri@protonmail.org,Lakshadweep
Persaud,268-1152,persaud302@aol.co.uk,Dadra and Nagar Haveli
Joshi,1-869-326-6582,joshi4288@hotmail.com,OR
Subram,1-172-433-4318,subram@hotmail.edu,MH
Sehgal,647-1701,sehgal@outlook.co.uk,DD
```

##### Output 1

```
yahoo.net
hotmail.com
protonmail.org
aol.co.uk
hotmail.com
hotmail.edu
outlook.co.uk
```

#### Private

##### Input 1

```
Suri,1-134-516-1754,suri@protonmail.org,Lakshadweep
Persaud,268-1152,persaud302@aol.co.uk,Dadra and Nagar Haveli
Joshi,1-869-326-6582,joshi4288@hotmail.com,OR
Subram,1-172-433-4318,subram@hotmail.edu,MH
```

##### Output 1

```
protonmail.org
aol.co.uk
hotmail.com
hotmail.edu
```

##### Input 2

```
Suri,1-134-516-1754,suri@protonmail.org,Lakshadweep
```

##### Output 2

```
protonmail.org
```

##### Input 3

```

```

##### Output 3

```

```

---

<div style="page-break-after: always;"></div>

## Problem 2 (SED) (logical and)

Write a SED script which will print line with all the lines have the `hotmail` domain except the domain `hotmail.com`

Note: Domain name in an email address is anything which comes after '@'. e.g. in ashok@somemail.com the @somemail.com is the domain name.

**Sample input**

```bash
name,phone,email,region
Sahni,151-8534,sahni@hotmail.ca,KA
Mehta,1-322-248-9102,mehta@yahoo.net,Daman and Diu
Malik,1-335-746-5592,malik@hotmail.com,Andhra Pradesh
Suri,1-134-516-1754,suri@protonmail.org,Lakshadweep
Persaud,268-1152,persaud302@aol.co.uk,Dadra and Nagar Haveli
Joshi,1-869-326-6582,joshi4288@hotmail.com,OR
Subram,1-172-433-4318,subram@hotmail.edu,MH
```

**Sample output**

```bash
Sahni,151-8534,sahni@hotmail.ca,KA
Subram,1-172-433-4318,subram@hotmail.edu,MH
```

### Prefix

```bash
script() { echo '#!/bin/sed -f
```

### Suffix

```bash
'
}
```

### Invisible code

```bash
DIR=$RANDOM
while [ -d "$DIR" ]; do
  DIR=$RANDOM
done
mkdir -p "$DIR" &> /dev/null
cd "$DIR"

script > script.sed
cat | sed -f script.sed 2>&1
```

### Solution

```bash
/hotmail/ {/com/d}
/hotmail/! d
```

### Test cases

#### Public

##### Input 1

```
name,phone,email,region
Sahni,151-8534,sahni@hotmail.ca,KA
Mehta,1-322-248-9102,mehta@yahoo.net,Daman and Diu
Malik,1-335-746-5592,malik@hotmail.com,Andhra Pradesh
Suri,1-134-516-1754,suri@protonmail.org,Lakshadweep
Persaud,268-1152,persaud302@aol.co.uk,Dadra and Nagar Haveli
Joshi,1-869-326-6582,joshi4288@hotmail.com,OR
Subram,1-172-433-4318,subram@hotmail.edu,MH
```

##### Output 1

```
Sahni,151-8534,sahni@hotmail.ca,KA
Subram,1-172-433-4318,subram@hotmail.edu,MH
```

#### Private

##### Input 1

```
Suri,1-134-516-1754,suri@protonmail.org,Lakshadweep
Persaud,268-1152,persaud302@aol.co.uk,Dadra and Nagar Haveli
Joshi,1-869-326-6582,joshi4288@hotmail.com,OR
Subram,1-172-433-4318,subram@hotmail.edu,MH
```

##### Output 1

```
Subram,1-172-433-4318,subram@hotmail.edu,MH
```

##### Input 2

```
Suri,1-134-516-1754,suri@protonmail.org,Lakshadweep
Persaud,268-1152,persaud302@aol.co.uk,Dadra and Nagar Haveli
```

##### Output 2

```

```

##### Input 3

```
name,phone,email,region
Madan,1-158-662-4996,madan@outlook.ca,GA
Persaud,1-877-704-5869,persaud@google.edu,Meghalaya
Srivas,1-516-922-8416,srivas@icloud.com,HR
Swami,761-1395,swami@google.couk,Haryana
Subram,981-5610,subram3142@yahoo.org,Karnataka
Nirmal,474-7526,nirmal@icloud.org,Madhya Pradesh
Sahni,151-8534,sahni@hotmail.ca,KA
Mahajan,1-548-689-8736,mahajan@icloud.couk,Bihar
Rana,1-528-385-7783,rana4716@yahoo.org,AN
Madan,768-6726,madan5937@yahoo.couk,Punjab
Sara,1-448-731-6473,sara8036@hotmail.ca,Chandigarh
Srivas,1-874-858-4328,srivas@protonmail.ca,Bihar
Chande,577-3719,chande6054@outlook.org,UT
Jai,1-301-224-9898,jai803@protonmail.edu,Dadra and Nagar Haveli
Vish,1-651-686-2992,vish1250@google.ca,BR
Sen,387-3246,sen3911@icloud.org,Madhya Pradesh
Charan,1-432-280-1268,charan@google.com,Punjab
Chandra,1-669-675-5189,chandra@icloud.com,DN
Aggarwal,786-0887,aggarwal@outlook.ca,RJ
Nigam,685-8638,nigam4332@icloud.edu,Kerala
Charan,240-2594,charan@aol.net,GA
Kumar,1-818-889-6444,kumar5531@google.org,Punjab
Neela,1-812-207-6963,neela@protonmail.org,JH
Pal,803-1232,pal2325@google.net,LD
Chakrabarti,559-5522,chakrabarti@aol.couk,Chandigarh
Darsha,1-539-623-5777,darsha6909@outlook.com,MN
Prasad,1-255-648-5166,prasad6565@aol.couk,MH
Sharma,1-836-703-0412,sharma33@outlook.com,PB
Lalit,325-8787,lalit@google.net,AN
Rai,1-536-292-1581,rai1805@yahoo.org,Odisha
Naran,1-755-385-2632,naran@aol.ca,KA
Nagpal,886-2975,nagpal@hotmail.edu,Uttar Pradesh
Sethi,263-4339,sethi@yahoo.edu,Uttar Pradesh
Jindal,1-588-720-8561,jindal8276@yahoo.net,MN
Rajagopal,723-7687,rajagopal@icloud.ca,MZ
Subramani,961-9663,subramani@hotmail.org,Sikkim
Aggarwal,158-5434,aggarwal@yahoo.net,AP
Kishore,1-593-822-1221,kishore2137@outlook.org,CT
Sai,1-274-542-3670,sai175@google.com,CT
Malhotra,413-8278,malhotra6699@aol.com,West Bengal
Mati,138-3736,mati4123@icloud.couk,Pondicherry
Srini,521-8273,srini7637@icloud.ca,Gujarat
Pal,1-822-348-3464,pal@icloud.couk,Chandigarh
Subramani,528-3574,subramani3878@hotmail.ca,JH
Swami,1-768-835-5551,swami@protonmail.org,Tripura
Mahajan,744-7489,mahajan5635@google.com,Kerala
Kumar,460-7226,kumar1079@aol.com,Arunachal Pradesh
Bhatt,1-397-282-8532,bhatt5754@hotmail.org,MH
Chandra,1-419-695-4340,chandra8640@protonmail.ca,Mizoram
Lalit,1-946-714-3378,lalit4423@google.com,OR
Srini,861-3258,srini9708@hotmail.couk,Haryana
Subramani,1-562-816-3258,subramani7488@google.ca,Punjab
Saini,798-2761,saini@yahoo.net,Jharkhand
Neel,1-271-696-6888,neel1381@aol.couk,Goa
Tyagi,445-6697,tyagi@aol.com,WB
Shan,1-274-441-4436,shan@google.org,DD
Narang,1-847-794-6642,narang5855@protonmail.net,DD
Punj,251-9196,punj@yahoo.couk,HR
Subram,1-378-484-5468,subram3701@aol.edu,Nagaland
Kumar,1-261-226-4429,kumar@protonmail.edu,Himachal Pradesh
Naran,1-801-229-2137,naran@icloud.org,UT
Vish,1-715-952-5078,vish6743@hotmail.ca,Chhattisgarh
Lalit,189-0642,lalit@aol.com,Lakshadweep
Vish,1-511-512-4356,vish4172@yahoo.ca,BR
Neela,558-6617,neela4868@icloud.org,TR
Neel,140-8833,neel575@aol.ca,Meghalaya
Engineer,563-4983,engineer8193@icloud.ca,Madhya Pradesh
Neelam,603-7806,neelam@yahoo.edu,KA
Rana,1-847-605-5352,rana4214@outlook.edu,Tamil Nadu
Sai,1-863-605-4845,sai@aol.org,Himachal Pradesh
Bhat,1-765-583-7472,bhat@hotmail.ca,Punjab
Rastogi,1-204-227-6993,rastogi@icloud.com,Gujarat
Chandra,1-644-844-8514,chandra4450@icloud.ca,DD
Charan,1-689-544-7183,charan9726@protonmail.couk,MZ
Jai,214-2595,jai@outlook.org,Pondicherry
Mehta,1-322-248-9102,mehta@yahoo.net,Daman and Diu
Malik,1-335-746-5592,malik@hotmail.com,Andhra Pradesh
Suri,1-134-516-1754,suri@protonmail.org,Lakshadweep
Persaud,268-1152,persaud302@aol.couk,Dadra and Nagar Haveli
Joshi,1-869-326-6582,joshi4288@hotmail.com,OR
Subram,1-172-433-4318,subram@hotmail.edu,MH
Sehgal,647-1701,sehgal@outlook.couk,DD
Chauhan,758-5516,chauhan@hotmail.org,Punjab
Subramanian,326-8960,subramanian6951@aol.org,Mizoram
Chakrabarti,1-742-281-0403,chakrabarti581@google.edu,TN
Shan,566-0248,shan@icloud.net,West Bengal
Engineer,1-725-535-8362,engineer@outlook.edu,NL
Mittal,852-7662,mittal@yahoo.couk,RJ
Mehta,1-422-288-2383,mehta2584@aol.net,Chandigarh
Mehta,557-7194,mehta@aol.couk,JH
Chandrasekar,1-240-661-3326,chandrasekar8623@hotmail.ca,MH
Dutta,218-5952,dutta@aol.net,Jammu and Kashmir
Mahajan,676-1507,mahajan@aol.net,PY
Kapoor,683-2217,kapoor3537@aol.net,Daman and Diu
Ganesh,711-9782,ganesh1482@hotmail.com,HR
Sai,250-9472,sai5239@icloud.org,HR
Engineer,1-726-734-2207,engineer4750@aol.edu,HP
Srivas,458-3143,srivas3221@icloud.com,Bihar
Samuel,894-7088,samuel@protonmail.org,Punjab
Neel,762-4746,neel@google.couk,OR
```

##### Output 3

```
Sahni,151-8534,sahni@hotmail.ca,KA
Sara,1-448-731-6473,sara8036@hotmail.ca,Chandigarh
Nagpal,886-2975,nagpal@hotmail.edu,Uttar Pradesh
Subramani,961-9663,subramani@hotmail.org,Sikkim
Subramani,528-3574,subramani3878@hotmail.ca,JH
Bhatt,1-397-282-8532,bhatt5754@hotmail.org,MH
Srini,861-3258,srini9708@hotmail.couk,Haryana
Vish,1-715-952-5078,vish6743@hotmail.ca,Chhattisgarh
Bhat,1-765-583-7472,bhat@hotmail.ca,Punjab
Subram,1-172-433-4318,subram@hotmail.edu,MH
Chauhan,758-5516,chauhan@hotmail.org,Punjab
Chandrasekar,1-240-661-3326,chandrasekar8623@hotmail.ca,MH
```

##### Input 4

```
name,phone,email,region
Chandrasekar,1-240-661-3326,chandrasekar8623@hotmail.ca,MH
Madan,1-158-662-4996,madan@outlook.ca,GA
Persaud,1-877-704-5869,persaud@google.edu,Meghalaya
Srivas,1-516-922-8416,srivas@icloud.com,HR
Swami,761-1395,swami@google.couk,Haryana
Subram,981-5610,subram3142@yahoo.org,Karnataka
Nirmal,474-7526,nirmal@icloud.org,Madhya Pradesh
Sahni,151-8534,sahni@hotmail.ca,KA
Mahajan,1-548-689-8736,mahajan@icloud.couk,Bihar
Rana,1-528-385-7783,rana4716@yahoo.org,AN
Madan,768-6726,madan5937@yahoo.couk,Punjab
Sara,1-448-731-6473,sara8036@hotmail.ca,Chandigarh
Srivas,1-874-858-4328,srivas@protonmail.ca,Bihar
Chande,577-3719,chande6054@outlook.org,UT
Jai,1-301-224-9898,jai803@protonmail.edu,Dadra and Nagar Haveli
Vish,1-651-686-2992,vish1250@google.ca,BR
Sen,387-3246,sen3911@icloud.org,Madhya Pradesh
Charan,1-432-280-1268,charan@google.com,Punjab
Chandra,1-669-675-5189,chandra@icloud.com,DN
Aggarwal,786-0887,aggarwal@outlook.ca,RJ
Nigam,685-8638,nigam4332@icloud.edu,Kerala
Charan,240-2594,charan@aol.net,GA
Kumar,1-818-889-6444,kumar5531@google.org,Punjab
Neela,1-812-207-6963,neela@protonmail.org,JH
Pal,803-1232,pal2325@google.net,LD
Chakrabarti,559-5522,chakrabarti@aol.couk,Chandigarh
Darsha,1-539-623-5777,darsha6909@outlook.com,MN
Prasad,1-255-648-5166,prasad6565@aol.couk,MH
Sharma,1-836-703-0412,sharma33@outlook.com,PB
Lalit,325-8787,lalit@google.net,AN
Rai,1-536-292-1581,rai1805@yahoo.org,Odisha
Naran,1-755-385-2632,naran@aol.ca,KA
Nagpal,886-2975,nagpal@hotmail.edu,Uttar Pradesh
Sethi,263-4339,sethi@yahoo.edu,Uttar Pradesh
Jindal,1-588-720-8561,jindal8276@yahoo.net,MN
Rajagopal,723-7687,rajagopal@icloud.ca,MZ
Subramani,961-9663,subramani@hotmail.org,Sikkim
Aggarwal,158-5434,aggarwal@yahoo.net,AP
Kishore,1-593-822-1221,kishore2137@outlook.org,CT
Sai,1-274-542-3670,sai175@google.com,CT
Malhotra,413-8278,malhotra6699@aol.com,West Bengal
Mati,138-3736,mati4123@icloud.couk,Pondicherry
Srini,521-8273,srini7637@icloud.ca,Gujarat
Pal,1-822-348-3464,pal@icloud.couk,Chandigarh
Subramani,528-3574,subramani3878@hotmail.ca,JH
Swami,1-768-835-5551,swami@protonmail.org,Tripura
Mahajan,744-7489,mahajan5635@google.com,Kerala
Kumar,460-7226,kumar1079@aol.com,Arunachal Pradesh
Bhatt,1-397-282-8532,bhatt5754@hotmail.org,MH
Chandra,1-419-695-4340,chandra8640@protonmail.ca,Mizoram
Lalit,1-946-714-3378,lalit4423@google.com,OR
Srini,861-3258,srini9708@hotmail.couk,Haryana
Subramani,1-562-816-3258,subramani7488@google.ca,Punjab
Saini,798-2761,saini@yahoo.net,Jharkhand
Neel,1-271-696-6888,neel1381@aol.couk,Goa
Tyagi,445-6697,tyagi@aol.com,WB
Shan,1-274-441-4436,shan@google.org,DD
Narang,1-847-794-6642,narang5855@protonmail.net,DD
Punj,251-9196,punj@yahoo.couk,HR
Subram,1-378-484-5468,subram3701@aol.edu,Nagaland
Kumar,1-261-226-4429,kumar@protonmail.edu,Himachal Pradesh
Naran,1-801-229-2137,naran@icloud.org,UT
Vish,1-715-952-5078,vish6743@hotmail.ca,Chhattisgarh
Lalit,189-0642,lalit@aol.com,Lakshadweep
Vish,1-511-512-4356,vish4172@yahoo.ca,BR
Neela,558-6617,neela4868@icloud.org,TR
Neel,140-8833,neel575@aol.ca,Meghalaya
Engineer,563-4983,engineer8193@icloud.ca,Madhya Pradesh
Neelam,603-7806,neelam@yahoo.edu,KA
Rana,1-847-605-5352,rana4214@outlook.edu,Tamil Nadu
Sai,1-863-605-4845,sai@aol.org,Himachal Pradesh
Bhat,1-765-583-7472,bhat@hotmail.ca,Punjab
Rastogi,1-204-227-6993,rastogi@icloud.com,Gujarat
Chandra,1-644-844-8514,chandra4450@icloud.ca,DD
Charan,1-689-544-7183,charan9726@protonmail.couk,MZ
Jai,214-2595,jai@outlook.org,Pondicherry
Mehta,1-322-248-9102,mehta@yahoo.net,Daman and Diu
Malik,1-335-746-5592,malik@hotmail.com,Andhra Pradesh
Suri,1-134-516-1754,suri@protonmail.org,Lakshadweep
Persaud,268-1152,persaud302@aol.couk,Dadra and Nagar Haveli
Joshi,1-869-326-6582,joshi4288@hotmail.com,OR
Subram,1-172-433-4318,subram@hotmail.edu,MH
Sehgal,647-1701,sehgal@outlook.couk,DD
Chauhan,758-5516,chauhan@hotmail.org,Punjab
Subramanian,326-8960,subramanian6951@aol.org,Mizoram
Chakrabarti,1-742-281-0403,chakrabarti581@google.edu,TN
Shan,566-0248,shan@icloud.net,West Bengal
Engineer,1-725-535-8362,engineer@outlook.edu,NL
Mittal,852-7662,mittal@yahoo.couk,RJ
Mehta,1-422-288-2383,mehta2584@aol.net,Chandigarh
Mehta,557-7194,mehta@aol.couk,JH
Dutta,218-5952,dutta@aol.net,Jammu and Kashmir
Mahajan,676-1507,mahajan@aol.net,PY
Kapoor,683-2217,kapoor3537@aol.net,Daman and Diu
Ganesh,711-9782,ganesh1482@hotmail.com,HR
Sai,250-9472,sai5239@icloud.org,HR
Engineer,1-726-734-2207,engineer4750@aol.edu,HP
Srivas,458-3143,srivas3221@icloud.com,Bihar
Samuel,894-7088,samuel@protonmail.org,Punjab
Neel,762-4746,neel@google.couk,OR
```

##### Output 4

```
Chandrasekar,1-240-661-3326,chandrasekar8623@hotmail.ca,MH
Sahni,151-8534,sahni@hotmail.ca,KA
Sara,1-448-731-6473,sara8036@hotmail.ca,Chandigarh
Nagpal,886-2975,nagpal@hotmail.edu,Uttar Pradesh
Subramani,961-9663,subramani@hotmail.org,Sikkim
Subramani,528-3574,subramani3878@hotmail.ca,JH
Bhatt,1-397-282-8532,bhatt5754@hotmail.org,MH
Srini,861-3258,srini9708@hotmail.couk,Haryana
Vish,1-715-952-5078,vish6743@hotmail.ca,Chhattisgarh
Bhat,1-765-583-7472,bhat@hotmail.ca,Punjab
Subram,1-172-433-4318,subram@hotmail.edu,MH
Chauhan,758-5516,chauhan@hotmail.org,Punjab
```

---

<div style="page-break-after: always;"></div>

## Problem 3 (SED)

Write a SED script to mask the first 6 digits of the phone numbers with asterisks, such that only last four digits of phone number of ten digits are visible. The phone number could be present anywhere in the text but it will be in the format of continuous ten digits starting with either of 9, 8, 7 and 6.

**Sample Input**

```
Yesterday I received a message from 9876543210, it has numerical sequence 1234567890 in it. then soon after I received the same message from 9876543211 as well. Then I called 9876543212 to inquire about it, they gave a reference id AHDISJ12354 and a fallback code 3245112341 as well.
```

**Sample Output**

```
Yesterday I received a message from ******3210, it has numerical sequence 1234567890 in it. then soon after I received the same message from ******3211 as well. Then I called ******3212 to inquire about it, they gave a reference id AHDISJ12354 and a fallback code 3245112341 as well.
```

### Prefix

```bash
script() { echo '#!/bin/sed -f
```

### Suffix

```bash
'
}
```

### Invisible code

```bash
DIR=$RANDOM
while [ -d "$DIR" ]; do
  DIR=$RANDOM
done
mkdir -p "$DIR" &> /dev/null
cd "$DIR"

script > script.sed
cat | sed -f script.sed 2>&1
```

### Solution

```bash
s/\b[6789][0-9]\{5\}\([0-9]\{4\}\)\b/******\1/g
```

### Test cases

#### Public

##### Input 1

```
Yesterday I received a message from 9876543210, it has numerical sequence 1234567890 in it. then soon after I received the same message from 9876543211 as well. Then I called 9876543212 to inquire about it, they gave a reference id AHDISJ12354 and a fallback code 3245112341 as well.
```

##### Output 1

```
Yesterday I received a message from ******3210, it has numerical sequence 1234567890 in it. then soon after I received the same message from ******3211 as well. Then I called ******3212 to inquire about it, they gave a reference id AHDISJ12354 and a fallback code 3245112341 as well.
```

#### Private

##### Input 1

```
9876543216 9876543216
9876543216 9876543216
9876543216 9876543216
9876543216 9876543216
```

##### Output 1

```
******3216 ******3216
******3216 ******3216
******3216 ******3216
******3216 ******3216
```

##### Input 2

```
9876543216
```

##### Output 2

```
******3216
```

##### Input 3

```
1234567898
```

##### Output 3

```
1234567898
```

##### Input 4

```
fhgiuawohrf eiwjlakhf gviueowahrfoiqwaeyfrhiwqeao ft
```

##### Output 4

```
fhgiuawohrf eiwjlakhf gviueowahrfoiqwaeyfrhiwqeao ft
```

---

<div style="page-break-after: always;"></div>

## Problem 4 (AWK)

A data file contains time series data of temperature, pressure and humidity obtained from sensors. The first line contains the headers. When certain sensor does not work it prints "Err" instead of a value.
Write a AWK script to clean up the data by removing the rows with incomplete data while printing the total number of deleted records(lines) at the end.

**Sample Input**

```
time,temperature,pressure,humidity
2012-10-13 12.00,304.5,29.71,80
2012-10-14 12.00,303.2,29.68,78
2012-10-15 12.00,Err,29.68,80
2012-10-16 12.00,300.9,29.71,Err
```

**Sample Output**

```
time,temperature,pressure,humidity
2012-10-13 12.00,304.5,29.71,80
2012-10-14 12.00,303.2,29.68,78
2
```

### Prefix

```bash
script() { echo '#!/bin/awk -f
```

### Suffix

```bash
'
}
```

### Invisible code

```bash
DIR=$RANDOM
while [ -d "$DIR" ]; do
  DIR=$RANDOM
done
mkdir -p "$DIR" &> /dev/null
cd "$DIR"

script > script.awk
cat | awk -f script.awk 2>&1
```

### Solution

```bash
!/Err/ {
    print
}

/Err/ {
    ++count
}

END {
    if (count) {
        print count
    } else {
        print 0
    }
}
```

### Test cases

#### Public

##### Input 1

```
time,temperature,pressure,humidity
2012-10-13 12.00,304.5,29.71,80
2012-10-14 12.00,303.2,29.68,78
2012-10-15 12.00,Err,29.68,80
2012-10-16 12.00,300.9,29.71,Err

```

##### Output 1

```
time,temperature,pressure,humidity
2012-10-13 12.00,304.5,29.71,80
2012-10-14 12.00,303.2,29.68,78
2
```

#### Private

##### Input 1

```
time,temperature,pressure,humidity
2012-10-13 12.00,304.5,29.71,80
2012-10-14 12.00,303.2,29.68,78
2012-10-15 12.00,Err,29.68,80
```

##### Output 1

```
time,temperature,pressure,humidity
2012-10-13 12.00,304.5,29.71,80
2012-10-14 12.00,303.2,29.68,78
1
```

##### Input 2

```
time,temperature,pressure,humidity
2012-10-15 12.00,Err,29.68,80
```

##### Output 2

```
time,temperature,pressure,humidity
1
```

##### Input 3

```
time,temperature,pressure,humidity
2012-10-13 12.00,304.5,29.71,80
2012-10-14 12.00,303.2,29.68,78
2012-10-15 12.00,301,29.68,80
2012-10-16 12.00,300.9,29.71,79

```

##### Output 3

```
time,temperature,pressure,humidity
2012-10-13 12.00,304.5,29.71,80
2012-10-14 12.00,303.2,29.68,78
2012-10-15 12.00,301,29.68,80
2012-10-16 12.00,300.9,29.71,79
0
```

##### Input 4

```
time,temperature,pressure,humidity

```

##### Output 4

```
time,temperature,pressure,humidity
0
```

##### Input 5

```
time,temperature,pressure,humidity
2012-10-13 12.00,304.5,29.71,Err
2012-10-14 12.00,303.2,29.68,Err
2012-10-15 12.00,Err,29.68,80
```

##### Output 5

```
time,temperature,pressure,humidity
3
```

---

<div style="page-break-after: always;"></div>

## Problem 5 (AWK)

The student attendance data in school is stored in CSV format. The file contains column for date and for each student and row headers with date. If a student is present it is marked as 1 else 0.
Write a AWK script which will count number of present days for each student and print the percentage attendance with default formatting by AWK.

**Sample Input**

```
Date,Ajay,Neha,Mayuri,Gaurav,Nitish,Minami
20/04/2023,1,1,0,1,0,1
21/04/2023,1,1,1,1,1,1
22/04/2023,0,1,0,1,1,1
23/04/2023,1,0,1,0,1,1
```

**Sample Output**

```
Ajay 75
Neha 75
Mayuri 50
Gaurav 75
Nitish 75
Minami 100
```

### Prefix

```bash
script() { echo '#!/bin/awk -f
```

### Suffix

```bash
'
}
```

### Invisible code

```bash
DIR=$RANDOM
while [ -d "$DIR" ]; do
  DIR=$RANDOM
done
mkdir -p "$DIR" &> /dev/null
cd "$DIR"

script > script.awk
cat | awk -f script.awk 2>&1
```

### Solution

```bash
BEGIN {
    FS = ","
}

NR == 1 {
    COLUMN_COUNT = NF
	for (i = 2; i <= NF; i++) {
		header[i] = $i
	}
	next
}

NR > 1 {
	for (i = 2; i <= NF; i++) {
		sum[i] += $i
	}
}

END {
	for (i = 2; i <= COLUMN_COUNT; i++) {
		print header[i],(sum[i] * 100 / (NR - 1))
	}
}
```

### Test cases

#### Public

##### Input 1

```
Date,Ajay,Neha,Mayuri,Gaurav,Nitish,Minami
20/04/2023,1,1,0,1,0,1
21/04/2023,1,1,1,1,1,1
22/04/2023,0,1,0,1,1,1
23/04/2023,1,0,1,0,1,1

```

##### Output 1

```
Ajay 75
Neha 75
Mayuri 50
Gaurav 75
Nitish 75
Minami 100
```

##### Input 2

```
Date,Ajay,Neha,Mayuri,Gaurav,Nitish,Minami
20/04/2023,1,1,0,1,0,1
21/04/2023,1,1,1,1,1,1
22/04/2023,0,1,0,1,1,1
23/04/2023,1,0,1,0,1,1
24/04/2023,1,0,1,0,1,1
25/04/2023,1,0,1,0,1,1
26/04/2023,1,0,1,0,1,1

```

##### Output 2

```
Ajay 85.7143
Neha 42.8571
Mayuri 71.4286
Gaurav 42.8571
Nitish 85.7143
Minami 100
```

##### Input 3

```
Date,Ajay,Neha,Mayuri
20/04/2023,1,1,0
21/04/2023,1,1,1
22/04/2023,0,1,0
23/04/2023,1,0,1
24/04/2023,1,0,1
25/04/2023,1,0,1
26/04/2023,1,0,1

```

##### Output 3

```
Ajay 85.7143
Neha 42.8571
Mayuri 71.4286
```

#### Private

##### Input 1

```
Date,Ajay,Krish,Mayuri
20/04/2023,1,1,0
21/04/2023,1,1,1
22/04/2023,0,1,0
23/04/2023,1,0,1
24/04/2023,1,0,1
25/04/2023,1,0,1
26/04/2023,1,0,1

```

##### Output 1

```
Ajay 85.7143
Krish 42.8571
Mayuri 71.4286
```

##### Input 2

```
Date,Ajay,Neha,Mayuri
20/04/2023,1,1,0

```

##### Output 2

```
Ajay 100
Neha 100
Mayuri 0
```

##### Input 3

```
Date,Ajay,Neha,Mayuri,Gaurav,Nitish,Minami
20/04/2023,1,1,0,1,0,1
21/04/2023,1,1,1,1,1,1
22/04/2023,0,1,0,1,1,1
23/04/2023,1,0,1,0,1,1
24/04/2023,1,0,1,0,1,1
25/04/2023,1,0,1,0,1,1
26/04/2023,1,0,1,0,1,1
27/04/2023,1,1,1,1,1,1

```

##### Output 3

```
Ajay 87.5
Neha 50
Mayuri 75
Gaurav 50
Nitish 87.5
Minami 100
```

##### Input 4

```
Date,Ajay,Neha,Mayuri,Gaurav,Nitish,Minami
20/04/2023,1,1,1,1,1,1
21/04/2023,1,1,1,1,1,1
22/04/2023,1,1,1,1,1,1
23/04/2023,1,1,1,1,1,1
24/04/2023,1,1,1,1,1,1
25/04/2023,1,1,1,1,1,1
26/04/2023,1,1,1,1,1,1
27/04/2023,1,1,1,1,1,1

```

##### Output 4

```
Ajay 100
Neha 100
Mayuri 100
Gaurav 100
Nitish 100
Minami 100
```

---

<div style="page-break-after: always;"></div>

## Problem 6 (AWK)

In a large bank they keep track of a file for customer interaction every day. The files `day1.csv` and `day2.csv` holds the data of customer id, token number and counter for two days.
Write an **AWK script** to find all the customers who visited the bank on both the days and print customer id, token number on day 1, counter on day 1, token number on day 2 and counter on day 2. Refer the provided sample below. The files `day1.csv` and `day2.csv` will be passed as arguments respectively.

**day1.csv**

```
customer_id,token_number,counter
1,3473,1a
2,3480,1b
3,5034,1c
4,4368,1d
5,4755,2a
6,5150,2b
7,4449,2c
8,4356,2d
9,3937,3a
10,4412,3b
11,4700,3c
12,4017,3d
13,4944,4a
14,3878,4b
15,5280,4c
16,5177,4d
17,5354,5a
18,3692,5b
19,4850,5c
20,3378,5d
```

**day2.csv**

```
customer_id,token_number,counter
1,1254218,10z
3,1245114,11x
5,1260578,11y
7,1251738,11z
9,1246319,12x
11,1238011,12y
13,1252070,12z
15,1249561,13x
17,1264570,13y
19,1236374,13z
```

**Expected output**

```
customer_id,token_number,counter,token_number,counter
1,3473,1a,1254218,10z
3,5034,1c,1245114,11x
5,4755,2a,1260578,11y
7,4449,2c,1251738,11z
9,3937,3a,1246319,12x
11,4700,3c,1238011,12y
13,4944,4a,1252070,12z
15,5280,4c,1249561,13x
17,5354,5a,1264570,13y
19,4850,5c,1236374,13z
```

### Prefix

```bash
script() { echo '#!/bin/awk -f
```

### Suffix

```bash
'
}
```

### Invisible code

```bash
DIR=$RANDOM
while [ -d "$DIR" ]; do
  DIR=$RANDOM
done
mkdir -p "$DIR" &> /dev/null
cd "$DIR"

script > script.awk
while read -r line; do
  [ "$line" == "EOF" ] && break
  echo $line;
done > day1.csv
cat > day2.csv
awk -f script.awk day1.csv day2.csv 2>&1
```

### Solution

```bash
BEGIN {
    FS=","
    OFS=","
}
FNR == NR {
    a[$1]=$2
    b[$1]=$3
    next
}
a[$1] {
    print $1,a[$1],b[$1],$2,$3
}
```

### Test cases

#### Public

##### Input 1

```
customer_id,token_number,counter
1,3473,1a
2,3480,1b
3,5034,1c
4,4368,1d
5,4755,2a
6,5150,2b
7,4449,2c
8,4356,2d
9,3937,3a
10,4412,3b
11,4700,3c
12,4017,3d
13,4944,4a
14,3878,4b
15,5280,4c
16,5177,4d
17,5354,5a
18,3692,5b
19,4850,5c
20,3378,5d
EOF
customer_id,token_number,counter
1,1254218,10z
3,1245114,11x
5,1260578,11y
7,1251738,11z
9,1246319,12x
11,1238011,12y
13,1252070,12z
15,1249561,13x
17,1264570,13y
19,1236374,13z

```

##### Output 1

```
customer_id,token_number,counter,token_number,counter
1,3473,1a,1254218,10z
3,5034,1c,1245114,11x
5,4755,2a,1260578,11y
7,4449,2c,1251738,11z
9,3937,3a,1246319,12x
11,4700,3c,1238011,12y
13,4944,4a,1252070,12z
15,5280,4c,1249561,13x
17,5354,5a,1264570,13y
19,4850,5c,1236374,13z
```

#### Private

##### Input 1

```
customer_id,token_number,counter
1,3473,1a
EOF
customer_id,token_number,counter
1,34173,1z

```

##### Output 1

```
customer_id,token_number,counter,token_number,counter
1,3473,1a,34173,1z
```

##### Input 2

```
customer_id,token_number,counter
1,3473,1a
EOF
customer_id,token_number,counter
2,34173,1z

```

##### Output 2

```
customer_id,token_number,counter,token_number,counter

```

##### Input 3

```
customer_id,token_number,counter
1,3473,1a
EOF
customer_id,token_number,counter

```

##### Output 3

```
customer_id,token_number,counter,token_number,counter

```

##### Input 4

```
customer_id,token_number,counter
EOF
customer_id,token_number,counter
1,3473,1a

```

##### Output 4

```
customer_id,token_number,counter,token_number,counter

```

##### Input 5

```
customer_id,token_number,counter
1,3473,1a
2,3480,1b
3,5034,1c
4,4368,1d
5,4755,2a
6,5150,2b
7,4449,2c
8,4356,2d
9,3937,3a
10,4412,3b
11,4700,3c
12,4017,3d
13,4944,4a
14,3878,4b
15,5280,4c
16,5177,4d
17,5354,5a
18,3692,5b
20,3378,5d
EOF
customer_id,token_number,counter
1,1254218,10z
3,1245114,11x
5,1260578,11y
7,1251738,11z
9,1246319,12x
11,1238011,12y
13,1252070,12z
15,1249561,13x
17,1264570,13y

```

##### Output 5

```
customer_id,token_number,counter,token_number,counter
1,3473,1a,1254218,10z
3,5034,1c,1245114,11x
5,4755,2a,1260578,11y
7,4449,2c,1251738,11z
9,3937,3a,1246319,12x
11,4700,3c,1238011,12y
13,4944,4a,1252070,12z
15,5280,4c,1249561,13x
17,5354,5a,1264570,13y

```

---

<div style="page-break-after: always;"></div>

## Problem 7 (bash)

Write a bash script to print the number of background processes running after terminating the running sleep processes.
Hint: use killall command

### Prefix

```bash
script() {
```

### Suffix

```bash
}
```

### Invisible code

```bash
DIR=$RANDOM
while [ -d "$DIR" ]; do
  DIR=$RANDOM
done
mkdir -p "$DIR" &> /dev/null
cd "$DIR"

mkdir -p ~/.local/bin
while read -r line; do
    echo '#!/bin/sh
    sleep' $RANDOM '&' > ~/.local/bin/$line
    bash ~/.local/bin/$line &
done
for i in $(seq $(($RANDOM % 10))); do
    sleep 10 &
done
script 2>&1
```

### Solution

```bash
{
    killall sleep
    sleep 2 # wait till all the sleep processes are killed
} &>/dev/null

jobs | wc -l
```

### Test cases

#### Public

##### Input 1

```
a
c
d
e
```

##### Output 1

```
4
```

#### Private

##### Input 1

```
a

```

##### Output 1

```
1
```

##### Input 2

```
a2
a1
b7
j8
u872

```

##### Output 2

```
5
```

##### Input 3

```
a1
a2
a3
a4
a5
a6
a7
a8
a9
a10
a11
a12
a13
a14
a15
a16
a17
a18

```

##### Output 3

```
18
```

##### Input 4

```
a6
a7
a8
a9
a10
a11
a12
a13
a14
a15
a16
a17
a18
```

##### Output 4

```
13
```

---

<div style="page-break-after: always;"></div>

## Problem 8 (bash)

Write a bash script to find and print the running user defined processes in the sorted order. The user defined process executable files exists only in the directory `~/.local/bin`

Note: Print only the distinct values (base name) in alphabetical sorted order

### Prefix

```bash
script() {
```

### Suffix

```bash
}
```

### Invisible code

```bash
DIR=$RANDOM
while [ -d "$DIR" ]; do
  DIR=$RANDOM
done
mkdir -p "$DIR" &> /dev/null
cd "$DIR"

mkdir -p ~/.local/bin
while read -r line; do
    echo '#!/bin/sh
    sleep' $RANDOM > ~/.local/bin/$line
    bash ~/.local/bin/$line &
done
for i in $(seq $(($RANDOM % 10))); do
    sleep 10 &
done
script 2>&1
```

### Solution

```bash
ps aux | grep "\.local/bin" | sed 's/.*\///' grep -Fxf <(ls ~/.local/bin) | sort | uniq
```

### Test cases

#### Public

##### Input 1

```
a
b
c
d

```

##### Output 1

```
4
```

#### Private

##### Input 1

```
a1
a2
a3
a4
a5
a6
a7
a8
a9
a10
a11
a12
a13
a14
a15
a16
a17
a18
a19
a20
a21
a22
a23
a24
a25
a26
a27
a28
a29
a30
a31
a32
a33
a34
a35
a36
a37
a38
a39
a40
a41
a42
a43
a44
a45
a46
a47
a48
a49
a50
a51
a52
a53
a54
a55
a56
a57
a58
a59
a60
a61
a62
a63
a64
a65
a66
a67
a68
a69
a70
a71
a72
a73
a74
a75
a76
a77
a78
a79
a80
a81
a82
a83
a84
a85
a86
a87
a88
a89
a90
a91
a92
a93
a94
a95
a96
a97
a98
a99
a100

```

##### Output 1

```
100
```
