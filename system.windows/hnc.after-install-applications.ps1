Write-Host "Removing auto-generated document by hnc office."
# HNC Office 2022
Remove-Item -path "$Env:userprofile\Documents\Welcome to Cell.cell" -Force
Remove-Item -path "$Env:userprofile\Documents\Welcome to Hwp.hwp" -Force
Remove-Item -path "$Env:userprofile\Documents\Welcome to Show.show" -Force
Remove-Item -path "$Env:userprofile\Documents\Welcome to Word.hwdt" -Force
