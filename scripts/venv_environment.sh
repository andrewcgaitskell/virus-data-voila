pip install -U wheel

pip install -U wget
pip install -U sqlalchemy
pip install -U psycopg2
pip install -U networkx
pip install -U ipympl
pip install -U scipy
pip install -U voila
pip install -U bqplot
pip install -U ipyvolume
pip install -U ipyleaflet
pip install -U folium
pip install -U ipympl
pip install -U geopandas
pip install -U pyepsg
pip install -U seaborn
pip install -U descartes
pip install -U PyShp
pip install -U geoalchemy2
pip install -U color
pip install -U xlrd

pip install -U pygeos

pip install -U jupyterhub
pip install -U jupyterlab
##pip install -U notebook

########## to install basemap ###### from here

##sudo apt install libgeos-3.6.2
##sudo apt install libgeos-dev
##sudo apt install libgeos-c1v5

##pip install https://github.com/matplotlib/basemap/archive/master.zip

######## to here ########



pip install -U ipywidgets

pip install ipykernel
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --sys-prefix  # Kinda important
pip install jupyter_nbextensions_configurator
jupyter nbextensions_configurator enable --sys-prefix
python -m ipykernel install --user --name=env
jupyter nbextension enable --py widgetsnbextension --sys-prefix
##jupyter labextension install @jupyter-widgets/jupyterlab-manager
