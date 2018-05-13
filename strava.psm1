function Get-StravaActivity {
    param(
        $AccessToken
    )

    Invoke-RestMethod -Uri 'https://www.strava.com/api/v3/athlete/activities' -Headers @{
        "Authorization" = "Bearer $AccessToken"
    }
}