// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// String dateTTime = '2021-10-15 13:00:00';

// String ISOString = '2021-10-15T18:35:00.000Z';
            
// Datetime ddddd = (Datetime)json.deserialize('"ISOString"', datetime.class);

string str1 = '"2013-01-30T07:38:44.268Z"';
System.debug(json.deserialize(str1, datetime.class));

System.debug('Hello World!');
System.debug(str1);