#!/bin/bash

# =============================================
#  Task 1 : Input & validation
# =============================================

if [ $# -ne 1 ];
then
        echo " please provide a log file"
        exit 1
fi

log_file=$1

if [ ! -f $log_file ];
then
        echo " File does't exist"
        exit 1
fi

# ==============================================
#  Task 2 : Error Count
# ==============================================
echo " "
Error_count=$(grep -Ei "ERROR|Failed" "$log_file" | wc -l )
echo " Total error count : $Error_count "
echo " "

# ==============================================
# Task 3 : Critical Events
# ==============================================

Critical_event=$(grep -n "CRITICAL" "$log_file" | while IFS=: read -r line                                            _num line_entry
do
        echo " Line $line_num: $line_entry "
done
)


echo "$Critical_event"
echo " "

# =============================================
#  Task 4 : Top error Message
# =============================================
 echo "--- Top 5 Error Messages ---"

 Top_error=$(grep -i "error" "$log_file" | sort | uniq -c | sort -nr | hea                                            d -5)

 echo "$Top_error"
 echo ""

# =============================================
# Task 5 : Summary Report
# =============================================

mkdir -p archive
analysis_date=$(date)
total_line_processed=$( wc -l < "$log_file")
report_file="archive/log_report_$(date +%F).txt"

{
        echo " ======= LOG ANALYSIS REPORT ====== "
        echo ""
        echo " Date of analysis  : $analysis_date "
        echo " Log file name     : $log_file "
        echo " Total lines processed : $total_line_processed "
        echo " Total error count : $Error_count "
        echo ""

        echo " ===== Top 5 error Message ====== "
        echo "$Top_error"
        echo ""

        echo " ====== Critical Events ====== "
        echo "$Critical_event"



} > "$report_file"

echo "Summary Report Generated: $report_file"
echo ""

# ===============================================
#  Task 6: Archive Processed logs
# ===============================================

mv $log_file ./archive/
echo " Log analysis complete "


# =========x============x===============x========
