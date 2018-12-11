# Detailed project notes

Building an OpenFaas Python function:

<https://blog.alexellis.io/first-faas-python-function/>

```bash
# Not sure I need faas-cli on macOS?
brew install faas-cli
# Setup a skeleton project
faas-cli new --lang python hello-python
# Build the Docker image
faas-cli build -f ./hello-python.yml
# Upload the Docker image to a repository
# Maybe I can just build the image on the master pi and skip the repo step
faas-cli push -f ./hello-python.yml
# Deploy the function
faas-cli deploy -f ./hello-python.yml
```

# Data

NYC Taxi Trips - lots of files are huge, the 2014 Green Taxis aren't too big

<http://www.nyc.gov/html/tlc/html/about/trip_record_data.shtml>

curl -O https://s3.amazonaws.com/nyc-tlc/trip+data/green_tripdata_2014-01.csv

