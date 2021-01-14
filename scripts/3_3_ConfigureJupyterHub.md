Now we start creating configuration files.

To keep everything together, we put all the configuration into the folder created for the virtualenv, under /opt/jupyterhub/etc/.

For each thing needing configuration, we will create a further subfolder and necessary files.

## JupyterHub Configuration

First create the folder for the JupyterHub configuration and navigate to it:

sudo mkdir -p /opt/jupyterhub/etc/jupyterhub/

cd /opt/jupyterhub/etc/jupyterhub/

Then generate the default configuration file

sudo /opt/jupyterhub/bin/jupyterhub --generate-config

This will produce the default configuration file

/opt/jupyterhub/etc/jupyterhub/jupyterhub_config.py

You will need to edit the configuration file to make the JupyterLab interface by the default.

Set the following configuration option in your jupyterhub_config.py file:

c.Spawner.default_url = '/lab'

Further configuration options may be found in the documentation.

## Setup Systemd Service

We will setup JupyterHub to run as a system service using Systemd (which is responsible for managing all services and servers that run on startup in Ubuntu). We will create a service file in a suitable location in the virtualenv folder and then link it to the system services.

First create the folder for the service file:

Create symlink our file into systemd’s directory:

sudo ln -s /home/jupyterlab/virus-data-voila/jupyterhub/systemd/jupyterhub.service /etc/systemd/system/jupyterhub.service

Then tell systemd to reload its configuration files

sudo systemctl daemon-reload

And finally enable the service

sudo systemctl enable jupyterhub.service

The service will start on reboot, but we can start it straight away using:

sudo systemctl start jupyterhub.service

…and check that it’s running using:

sudo systemctl status jupyterhub.service

You should now be already be able to access jupyterhub using <your servers ip>:8000
