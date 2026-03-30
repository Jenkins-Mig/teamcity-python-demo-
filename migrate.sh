#!/bin/bash

# 1. Capture the Dynamic Parameters from TeamCity
DEPOT_NAME="%env.TARGET_DEPOT%"
GIT_REPO="%env.GITHUB_REPO_URL%"

echo "Starting Migration for: $DEPOT_NAME"

# 2. Perform the 'Work' (Simulation)
# This represents your p4 to git migration command
echo "Syncing from Perforce: //custom_depot/$DEPOT_NAME/..."
sleep 3 
echo "Pushing to GitHub: $GIT_REPO"

# 3. Validation Logic
# Check if a specific file exists to 'verify' the migration
if [ -f "package.json" ] || [ -f "pom.xml" ]; then
    # Update the Build Status in the TeamCity UI
    echo "##teamcity[buildStatus text='SUCCESS: $DEPOT_NAME migrated to GitHub']"
else
    # Tell TeamCity exactly why the build failed
    echo "##teamcity[buildProblem description='Migration failed: Source files not found for $DEPOT_NAME']"
    exit 1
fi
