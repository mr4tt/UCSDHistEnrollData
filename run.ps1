# Figure out what term to use
$term = ""
$input_term = Read-Host "Enter term to process (e.g. WI23, FA23, SP24, etc.)"
if ($input_term.Length -ne 4 -and $input_term.Length -ne 5) {
    Write-Warning "[warn] Invalid term entered."
    exit 1
}

$input_term = $input_term.ToUpper()
# Extract first two characters of input_term
$term_type = $input_term.Substring(0, 2)
if ($term_type -eq "FA") {
    $term += "Fall"
} elseif ($term_type -eq "WI") {
    $term += "Winter"
} elseif ($term_type -eq "SP") {
    $term += "Spring"
} elseif ($term_type -eq "S1") {
    $term += "Summer1"
} elseif ($term_type -eq "S2") {
    $term += "Summer2"
} else {
    Write-Warning "[warn] Invalid term entered."
    exit 1  
}

$term_year = $input_term.Substring(2, 2)
# Is this a number?
if ($term_year -notmatch "^[0-9]+$") {
    Write-Warning "[warn] Invalid year entered."
    exit 1
}

$term += "20" + $term_year

$term_additional = $input_term.Substring(4)
if ($term_additional.Length -gt 0) {
    if ($term_additional -eq "D") {
        $term += "Drop"
    } else {
        Write-Warning "[warn] Invalid additional arguments entered."
        exit 1
    }
}

$plot_wide = Read-Host "Wide plot for data? (y/n)"
if ($plot_wide.ToLower() -ne "y") {
    $plot_wide = "n"
}

if ($plot_wide -eq "y") {
    Write-Host "Acknowledged: will create wide plots for data."
}

# check if UCSDHistEnrollData folder exists
# If it does, pull from repo for latest updates.
# Otherwise, clone
if (Test-Path -Path "UCSDHistEnrollData") {
    Set-Location UCSDHistEnrollData
    git pull
}
else {
    Write-Output "`tCloning..."
    git clone https://github.com/ewang2002/UCSDHistEnrollData
    Set-Location UCSDHistEnrollData
}

$sw = [Diagnostics.Stopwatch]::StartNew()
# Separate all Winter data if possible
if (Test-Path "separate_grad_courses.exe") {
    ./separate_grad_courses.exe _holding WI23 WI23G
    Write-Output "Separated Winter enrollment data successfully."
}
else {
    Write-Host "[warn] No separate_grad_courses.exe found!"
}

foreach ($term in $terms) {
    Write-Output "================== Processing $term. =================="
    Write-Output "`tCleaning raw CSVs."
    python clean_raw_csvs.py $term

    Write-Output "`tCategorizing enroll data."
    python enroll_data_cleaner.py $term

    Write-Output "`tPlotting overall data."
    python plot.py $term o
    Write-Output "`tPlotting section data."
    python plot.py $term s

    ./list_all_files $term
}

if ($plot_wide -eq "y") {
    # First, deal with undergrad data
    $overall_wide_folder = "WI23/plot_overall_wide"
    $section_wide_folder = "WI23/plot_section_wide"

    if (!(Test-Path $overall_wide_folder)) {
        New-Item -ItemType "directory" -Path $overall_wide_folder
    }

    if (!(Test-Path $section_wide_folder)) {
        New-Item -ItemType "directory" -Path $section_wide_folder
    }

    # plot it
    Write-Output "`tPlotting WI23 overall data (wide)."
    python plot.py WI23 ow
    Write-Output "`tPlotting WI23 section data (wide)."
    python plot.py WI23 sw

    # Finally, deal with grad data
    $grad_overall_wide_folder = "WI23G/plot_overall_wide"
    $grad_section_wide_folder = "WI23G/plot_section_wide"

    if (!(Test-Path $grad_overall_wide_folder)) {
        New-Item -ItemType "directory" -Path $grad_overall_wide_folder
    }
    
    if (!(Test-Path $grad_section_wide_folder)) {
        New-Item -ItemType "directory" -Path $grad_section_wide_folder
    }

    Write-Output "`tPlotting WI23G overall data (wide)."
    python plot.py WI23G ow
    Write-Output "`tPlotting WI23G section data (wide)."
    python plot.py WI23G sw
}

$sw.Stop()
$plot_time = $sw.Elapsed.TotalMinutes

# =============================================================== #
#                           GIT                                   # 
# =============================================================== #
$sw.Restart()
$base_msg = "%B %d, %Y - update (plot, automated)"
$term_msg = "Terms Updated: $terms_processed"
$dur_msg = "Took: $([Math]::Round($plot_time, 4)) minutes to plot ($plot_wide)."

# commit
Write-Output "`tCommitting changes."
git add .
git commit -m (Get-Date -UFormat $base_msg) -m $term_msg -m $dur_msg
git push

$sw.Stop()
$git_time = $sw.Elapsed.TotalMinutes

# =============================================================== #
#                         DONE                                    # 
# =============================================================== #

Write-Output "[plot] Took $([Math]::Round($plot_time, 4)) minutes to complete!"
Write-Output "[git ] Took $([Math]::Round($git_time, 4)) minutes to complete!"

Read-Host "Done! Press ENTER to exit."