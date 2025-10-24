#asocApiKeyId='xxxxxxxxxxxxx'
#asocApiKeySecret='xxxxxxxxxxxxx'
#serviceUrl='xxxxxxxxxxxxx'
#sevSecGw='xxxxxxxxxxxxx'
#maxIssuesAllowed=xxxxxxxxxxxxx

appId=$(cat appId.txt)

asocToken=$(curl -k -s -X POST --header 'Content-Type:application/json' --header 'Accept:application/json' -d '{"KeyId":"'"$asocApiKeyId"'","KeySecret":"'"$asocApiKeySecret"'"}' "https://$serviceUrl/api/v4/Account/ApiKeyLogin" | grep -oP '(?<="Token":\ ")[^"]*')

if [ -z "$asocToken" ]; then
	echo "The token variable is empty. Check the authentication process.";
    exit 1
fi

appFilter="((Id%20eq%20${appId}))"
appDetails=$(curl -k -s -X GET "https://$serviceUrl/api/v4/Apps?filter=$appFilter" -H 'accept:application/json' -H "Authorization:Bearer $asocToken")
curl -k -s -X 'GET' "https://$serviceUrl/api/v4/Account/Logout" -H 'accept: */*' -H "Authorization: Bearer $asocToken"

echo "Checking violations of the application against its compliance policies"
violations=$(echo $appDetails | jq -r '[.Items[0].ComplianceStatuses[] | select(.Compliant==false and .Enabled==true)]')
numViolations=$(echo $violations | jq -r 'length')

if [[ "$numViolations" -gt "0" ]]; then
  echo "$numViolations compliance policies violated !!"
  echo $violations | jq -r '.[].Name'
  exit 1
ese
  echo "No compliance policy violation"
fi


