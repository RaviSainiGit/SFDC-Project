public class httpRequestIntegration {
    
    public static void getFileFromS3(Id oid, String fileName) {
        if (!String.isBlank(filename)) {
            String url = 'callout:Connect_to_S3';
            HttpRequest req  = new HttpRequest();
            HttpResponse res = new HttpResponse();
            req.setEndpoint(url + '/' + filename);
            req.setMethod('GET');
            system.debug(req.getBody());
            Http http = new Http();
            res = http.send(req);
            System.debug(res.getStatusCode());
            system.debug(res.getBody());
            if (res.getStatusCode() == 404) {
                //retry once on failure, as there my delay in file creation on ENLM
                res = http.send(req);
                if(res.getStatusCode() == 200) {
                    ContentVersion conVer = new ContentVersion();
                    conVer.contentLocation = 'S';
                    conver.PathonClient = filename;
                    conVer.Title = filename.substringAfter('/');
                    conver.VersionData = res.getBodyasblob();
                    insert conVer;
                    Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
                    ContentDocumentLink conDocLink = New ContentDocumentLink();
                    conDocLink.LinkedEntityId = oid; 
                    conDocLink.ContentDocumentId = conDoc;  
                    conDocLink.shareType = 'V';
                    insert conDocLink;
                }
            }
            if(res.getStatusCode() == 200) {
                ContentVersion conVer = new ContentVersion();
                conVer.contentLocation = 'S';
                conver.PathonClient = filename;
                conVer.Title = filename.substringAfter('/');
                conver.VersionData = res.getBodyasblob();
                insert conVer;
                Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
                ContentDocumentLink conDocLink = New ContentDocumentLink();
                conDocLink.LinkedEntityId = oid; 
                conDocLink.ContentDocumentId = conDoc;  
                conDocLink.shareType = 'V';
                insert conDocLink;
            }
        }
    }
    
}