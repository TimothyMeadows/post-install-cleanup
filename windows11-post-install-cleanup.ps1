$cleanUp = @(
    # Microsoft bloatware
    "Microsoft.3DBuilder",
    "Microsoft.BingFinance",
    "Microsoft.BingNews",
    "Microsoft.BingSports",
    "Microsoft.BingWeather",
    "Microsoft.FreshPaint",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.Office.OneNote",
    "Microsoft.People",
    "Microsoft.WindowsMaps",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.GetHelp",
    "Microsoft.OfficeHub",
    "Microsoft.MixedReality.Portal",
    "Microsoft.SkypeApp",
    # Xbox
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    # Third party bloatware
    "9E2F88E3.Twitter",
    "PandoraMediaInc.29680B314EFC2",
    "Flipboard.Flipboard",
    "ShazamEntertainmentLtd.Shazam",
    "king.com.CandyCrushSaga",
    "king.com.CandyCrushSodaSaga",
    "ClearChannelRadioDigital.iHeartRadio"
)

foreach($app in $cleanUp) {
    Write-Output "Removing $app"
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
    Get-AppXProvisionedPackage -online | where {$_.PackageName -eq $app} | Remove-AppxProvisionedPackage -Online
}

Write-Output "post-install-cleanup done"
