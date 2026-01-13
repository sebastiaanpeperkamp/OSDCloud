$DebugPreference = "Continue"

Start-Transcript -Path "X:\OSDCloud\Debug.log" -Force
Write-Debug "Start Start-OSDCloud script"

# Variables
Write-Debug "Set Variables"
$Global:MyOSDCloud = [ordered]@{
    Restart = [bool]$true
    RecoveryPartition = [bool]$true
    OEMActivation = [bool]$true
    WindowsUpdate = [bool]$true          # Install Windows Updates after installing Windows
    WindowsUpdateDrivers = [bool]$true   # Update drivers during Windows Updates after installing Windows
    WindowsDefenderUpdate = [bool]$true  # Update Defender during Windows Updates after installing Windows
    SetTimeZone = [bool]$true
    ClearDiskConfirm = [bool]$False
    ShutdownSetupComplete = [bool]$false
    SyncMSUpCatDriverUSB = [bool]$true
    CheckSHA1 = [bool]$true
}

Write-Debug $($Global:MyOSDCloud | ConvertTo-Json)


Try {

    Write-Debug "Start Deployment"
    Start-OSDCloud -FindImageFile -OSImageIndex 1 -Manufacturer (Get-MyComputerManufacturer -Brief) -Product (Get-MyComputerProduct)

} Catch {

    Write-Debug "An error occured: $($_)"
    Throw $_
    
}

Stop-Transcript
