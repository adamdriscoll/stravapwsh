function Get-StravaActivity {
    [CmdletBinding(DefaultParameterSetName = 'list')]
    param(
        [Parameter(Mandatory = $true)]
        [string]$AccessToken,
        [Parameter(ParameterSetName = 'list')]
        [int]$Page = 1,
        [Parameter(ParameterSetName = 'list')]
        [int]$PerPage = 20,
        [Parameter(ParameterSetName = 'id')]
        [long]$Id,
        [Parameter(ParameterSetName = 'id')]
        [Switch]$IncludeAllEfforts
    )

    Process {
        if ($PSCmdlet.ParameterSetName -eq 'list') {
            Invoke-RestMethod -Uri "https://www.strava.com/api/v3/athlete/activities?page=$Page&per_page=$PerPage" -Headers @{
                "Authorization" = "Bearer $AccessToken"
            }
        } else {
            Invoke-RestMethod -Uri "https://www.strava.com/api/v3/athlete/activities/$Id?include_all_efforts=$IncludeAllEfforts" -Headers @{
                "Authorization" = "Bearer $AccessToken"
            }
        }
    }
}

function Get-StravaAthlete {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$AccessToken
    )

    Process {
        Invoke-RestMethod -Uri "https://www.strava.com/api/v3/athlete" -Headers @{
            "Authorization" = "Bearer $AccessToken"
        }
    }
}

function Get-StravaAthleteStat {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$AccessToken,
        [Parameter()]
        [int]$Page = 1,
        [Parameter()]
        [int]$PerPage = 20,
        [Parameter(Mandatory = $true)]
        [long]$Id
    )

    Process {
        Invoke-RestMethod -Uri "https://www.strava.com/api/v3/athletes/$Id/stats?page=$Page&per_page=$per_page" -Headers @{
            "Authorization" = "Bearer $AccessToken"
        }
    }
}

function Get-StravaAthleteZone {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$AccessToken
    )

    Process {
        Invoke-RestMethod -Uri "https://www.strava.com/api/v3/athlete/zones" -Headers @{
            "Authorization" = "Bearer $AccessToken"
        }
    }
}

function Get-StravaRoute {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$AccessToken,
        [Parameter(Mandatory = $true)]
        [int]$AthleteId
    )

    Process {
        Invoke-RestMethod -Uri "https://www.strava.com/api/v3/athletes/$AthleteId/routes" -Headers @{
            "Authorization" = "Bearer $AccessToken"
        }
    }
}

function Get-StravaClub {
    [CmdletBinding(DefaultParameterSetName = 'list')]
    param(
        [Parameter(Mandatory = $true)]
        [string]$AccessToken,
        [Parameter(ParameterSetName = 'list')]
        [int]$Page = 1,
        [Parameter(ParameterSetName = 'list')]
        [int]$PerPage = 20,
        [Parameter(Mandatory = $true, ParameterSetName = 'id')]
        [int]$Id 
    )

    Process {
        if ($PSCmdlet.ParameterSetName -eq 'list') {
            Invoke-RestMethod -Uri "https://www.strava.com/api/v3/athlete/clubs?page=$Page&per_page=$PerPage" -Headers @{
                "Authorization" = "Bearer $AccessToken"
            }
        }
        else {
            Invoke-RestMethod -Uri "https://www.strava.com/api/v3/clubs/$Id" -Headers @{
                "Authorization" = "Bearer $AccessToken"
            }
        }
    }
}

function Get-StravaClubActivity {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$AccessToken,
        [Parameter()]
        [int]$Page = 1,
        [Parameter()]
        [int]$PerPage = 20,
        [Parameter(Mandatory = $true)]
        [int]$ClubId 
    )

    Process {
        Invoke-RestMethod -Uri "https://www.strava.com/api/v3/clubs/$clubId/activities" -Headers @{
            "Authorization" = "Bearer $AccessToken"
        }
    }
}

function Get-StravaClubMember {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$AccessToken,
        [Parameter()]
        [int]$Page = 1,
        [Parameter()]
        [int]$PerPage = 20,
        [Parameter(Mandatory = $true)]
        [int]$ClubId 
    )

    Process {
        Invoke-RestMethod -Uri "https://www.strava.com/api/v3/clubs/$clubId/members" -Headers @{
            "Authorization" = "Bearer $AccessToken"
        }
    }
}

function Get-StravaClubAdministrator {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$AccessToken,
        [Parameter()]
        [int]$Page = 1,
        [Parameter()]
        [int]$PerPage = 20,
        [Parameter(Mandatory = $true)]
        [int]$ClubId 
    )

    Process {
        Invoke-RestMethod -Uri "https://www.strava.com/api/v3/clubs/$clubId/admins" -Headers @{
            "Authorization" = "Bearer $AccessToken"
        }
    }
}