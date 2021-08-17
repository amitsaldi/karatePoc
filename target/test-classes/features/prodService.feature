Feature: Check business logic for Product Service APIs

  Background:
    * url 'https://app.products.int.ap-southeast-2.dev.a-sharedinfra.net/'
    * header Content-Type = 'application/json'
     * header Authorization = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Im5PbzNaRHJPRFhFSzFqS1doWHNsSFJfS1hFZyIsImtpZCI6Im5PbzNaRHJPRFhFSzFqS1doWHNsSFJfS1hFZyJ9.eyJhdWQiOiJhcGk6Ly85NTYzNjIxMy1mOTkzLTRmYjgtYTBkZS00MzE5NTdkMjljMmUiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9jYmE4Y2EwMy04Yjk1LTQ0OGQtYjI1OS05OGE0NGQxMTJmN2MvIiwiaWF0IjoxNjI5MTgxMDAzLCJuYmYiOjE2MjkxODEwMDMsImV4cCI6MTYyOTE4NDkwMywiYWNyIjoiMSIsImFpbyI6IkFVUUF1LzhUQUFBQXVGMkt3M0dQVXlPcDlpdm9JRmZpd0VXcVFvaUNNdndtQ0lYRCt0Q2QzZ1pIY0lmMmxqS3BoR3JocDVaY0ZpdG1hVmVpRGkvZnpwZytoSmltSTJBaDVnPT0iLCJhbXIiOlsicHdkIiwid2lhIiwibWZhIl0sImFwcGlkIjoiOTU2MzYyMTMtZjk5My00ZmI4LWEwZGUtNDMxOTU3ZDI5YzJlIiwiYXBwaWRhY3IiOiIwIiwiZmFtaWx5X25hbWUiOiJTYWxkaSIsImdpdmVuX25hbWUiOiJBbWl0IiwiaXBhZGRyIjoiNTguOTYuNjYuNzkiLCJuYW1lIjoiQW1pdCBTYWxkaSIsIm9pZCI6IjczYzJhMjM1LTNkMjktNGU2ZS05Y2VlLTk2MDZmODcyY2MyYiIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS03NzA4MzI5ODMtMjkyOTk1ODg1My0xODAyMDk3NjQ0LTM5NTM0NSIsInJoIjoiMC5BUW9BQThxb3k1V0xqVVN5V1ppa1RSRXZmQk5pWTVXVC1iaFBvTjVER1ZmU25DNEtBQ2MuIiwicm9sZXMiOlsicm9sZXMucHJvZHVjdHMud3JpdGUiXSwic2NwIjoicHJvZHVjdHMucmVhZCBwcm9kdWN0cy53cml0ZSIsInN1YiI6IlFOemg3MXU3aFpfcTJqZDZBYTdwdUxiQnpUUl9mWXpkYlpUZGVBQUtWN2MiLCJ0aWQiOiJjYmE4Y2EwMy04Yjk1LTQ0OGQtYjI1OS05OGE0NGQxMTJmN2MiLCJ1bmlxdWVfbmFtZSI6IkFtaXQuU2FsZGlAa21hcnQuY29tLmF1IiwidXBuIjoiQW1pdC5TYWxkaUBrbWFydC5jb20uYXUiLCJ1dGkiOiJYTDdsejhOdkNVR0x3N0dvbGI0VUFBIiwidmVyIjoiMS4wIn0.SKmlm1GfY8NyIWGNwNTOz_HUinGFqn9sAgjjgheHR_ypO_6q3M_MqeSGt-lpqMsTCCKxRvwvBv-hzcDlRAqeinCoz5UH45YynBHMYKk9kKHpgKt2vc_unL8O_UZZwnEy-U951m5NhvcNaAj5D9_8mehse7L03CXZKfXV-19EniMofOcnYpsTq_u17ok7Q2gfYNDIaghF3rsOBl0RI3LNlClT5oJ68zbUZmiO6K7rvcY0CSPVQ7dzxhJ_qyHCpBzbjK226bMr93_g9q4PKkENGnEZX4eiDopZeShUISU-GrET6I11OT9Had6FgX1IQd8nqXoaoi2YAPVAh5Rpn1fcJQ'

  @getAttributes
  Scenario: Validate get All Attributes API
    Given path 'api/v1/attributes'
    And params { api-version: '1.0'}
    When method get
    Then status 200
    * match header content-type == 'application/json; charset=utf-8'

  @addOptionAttributes
  Scenario Outline: Validate post for adding attributes to an option 1
    Given path 'api/v1/options/<optionId>/attributes'
    * header accept = 'text/plain'
    And request [{"category": "Planning","subCategory": "Flexible","attributeName": "KEY TREND","attributeValue": "ASSYMETRIC"}]
    When method post
    Then status 204
    Examples:
    |optionId|
    |929fb981-2066-41ac-b2bf-5cd81dd003f0|

