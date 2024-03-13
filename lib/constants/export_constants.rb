FILE_NO = 1
EXPORT_OFFSET = 0
EXPORT_LIMIT = 1000000
SYNC_RENDER_MESSAGE = 'Synchronous export initiated'
ASYNC_RENDER_MESSAGE = 'Asynchronous export initiated.You will receive the download link in your mail'
EXPORT_CSV_HEADER = ["USERNAME","USER_EMAIL","PRODUCT_CODE","PRODUCT_NAME","PRODUCT_CATEGORY","ORDER_DATE"]
EXPORT_SUCCESS_MAIL = {
    subject: "Export Success Notification",
    body: <<-BODY
Hello,<br/><br/>
Your report is now ready for download.<br/>
<br/>
Please <a href='%{report_link}'>click here</a> to download the report.<br/><br/>
Thank you for using our service.<br/>
<br/>
Best regards<br/> 
BODY
  }
REPORT_LINK = "http://localhost:5000/%{filename}"
EMAIL_ID = "bunny.praveshn@gmail.com"