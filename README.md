# Prerequisites
- make ```sudo apt install make```
- python3-dev python3-pip ```sudo apt install python3-dev python3-pip```
- Python >= 3.6
- Install Stardog

# Install the requirements inside of a Python virtualenv (recommend)
```BASH
    pip install virtualenv
    
    virtualenv venv
    virtualenv -p python2 venv
    source venv/bin/activate
    
    make requirements
```

# Run project
```
    # (the application assumes a database called "interdrugs")
    export STARDOG_HOME=/opt/Protege/projects/FinalProject/stardog
    stardog/bin/stardog-admin db create -n interdrugs ontologies/interactingDrugs.ttl ontologies/interactingDrugs-inferences.ttl
    stardog/bin/stardog-admin server start --disable-security
    
    
    cd src
    python server.py
```