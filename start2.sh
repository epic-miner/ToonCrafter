#!/bin/bash

# Clone the repository if it doesn't exist
if [ ! -d "ToonCrafter" ]; then
    git clone https://github.com/ToonCrafter/ToonCrafter.git
fi

# Change directory to the repository
cd ToonCrafter

# Install the required Python packages if not already installed
if [ ! -f "requirements.txt" ]; then
    echo "requirements.txt not found. Exiting."
    exit 1
fi
pip install -r requirements.txt

# Create the checkpoints directory if it doesn't exist
if [ ! -d "checkpoints" ]; then
    mkdir checkpoints
fi
cd checkpoints

# Create the tooncrafter_512_interp_v1 directory if it doesn't exist
if [ ! -d "tooncrafter_512_interp_v1" ]; then
    mkdir tooncrafter_512_interp_v1
    cd tooncrafter_512_interp_v1

    # Download the model checkpoint if it doesn't exist
    if [ ! -f "model.ckpt" ]; then
        wget https://huggingface.co/Doubiiu/ToonCrafter/resolve/main/model.ckpt
    fi
else
    cd tooncrafter_512_interp_v1
fi

# Navigate back to the repository root
cd ../..

# Run the Gradio app
python gradio_app.py
