public class putHttpRequest {
    
    public static void putFileInS3FromObject(Id oid) {
        List<ContentDocumentLink> links=[SELECT ContentDocumentId,LinkedEntityId FROM ContentDocumentLink where LinkedEntityId=:oid];
        Set<Id> ids=new Set<Id>();
        for(ContentDocumentLink link:links)
        {
            ids.add(link.ContentDocumentId);
        }
        List<ContentVersion> versions=[SELECT VersionData,Title,ContentDocumentId,FileExtension FROM ContentVersion WHERE ContentDocumentId = :ids AND IsLatest = true];
        if (versions.size() > 0) {
            String attachmentBody = EncodingUtil.base64Encode(versions[0].VersionData);
            system.debug('file:'+ versions[0]);
            String formattedDateString = Datetime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
            String filename = versions[0].Title;
            //Update the content-type based on the file type being attached
            string contentType= 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
            system.debug('contentType:'+contentType);
            String url = 'callout:Connect_to_S3';
            HttpRequest req  = new HttpRequest();
            HttpResponse res  = new HttpResponse();
            req.setMethod('PUT');
            req.setEndpoint(url + filename);
            req.setHeader('Content-Length', String.valueOf(attachmentBody.length()));
            req.setHeader('Content-Encoding', 'UTF-8');
            req.setHeader('Content-type', contentType);
            req.setHeader('Connection', 'keep-alive');
            req.setHeader('Date', formattedDateString);
            req.setHeader('ACL', 'public-read');
            Blob pdfBlob = EncodingUtil.base64Decode(attachmentBody);
            req.setBodyAsBlob(pdfBlob);
            Http http = new Http();
            res = http.send(req);
            system.debug(res.getStatusCode());
            system.debug(res.getBody());
        }
    }
    
}