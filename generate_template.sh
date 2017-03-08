# This is a shell script to transform the PRODUCTNAME directory into a cookie-cutter template

#This is the only lookup that is done on filenames
LOOKUP="PRODUCTNAME"
EXPANDED="{{ cookiecutter.project_name | replace(' ', '') }}"

# Make the tree
find ./PRODUCTNAME -type d | while read FILE
do
    NEWFILE=`echo $FILE | LC_ALL=C sed -e "s/${LOOKUP}/${EXPANDED}/g"`
    echo "mkdir -p \"$NEWFILE\""
done

# Copy the files over
find ./PRODUCTNAME -type f | while read FILE
do
    NEWFILE=`echo $FILE | LC_ALL=C sed -e "s/${LOOKUP}/${EXPANDED}/g"`
    echo "cp \"$FILE\" \"$NEWFILE\""
done

# Do replacements
function replace {
    find ./PRODUCTNAME -type f | while read FILE
    do 
    NEWFILE=`echo $FILE | LC_ALL=C sed -e "s/${LOOKUP}/${EXPANDED}/g"`
        # Copy over incase the sed fails due to encoding
        echo "LC_ALL=C sed -e \"s/$1/$2/g\" \"$NEWFILE\" > t1 && mv t1 \"$NEWFILE\""
    done
}

replace "PRODUCTNAME" "{{ cookiecutter.project_name | replace(' ', '') }}"
replace "ORGANIZATION" "{{ cookiecutter.company_name }}"
replace "LEADDEVELOPER" "{{ cookiecutter.lead_dev }}"
replace "LEADEMAIL" "{{ cookiecutter.lead_email }}"
replace "com.raizlabs.PRODUCTNAME" "{{ cookiecutter.bundle_identifier }}"
