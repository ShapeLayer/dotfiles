jupyter notebook --generate-config
mkdir -p ~/.jupyter
echo "c.NotebookApp.allow_origin = '*'" >>  ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '[vpn_ip @ server]'" >>  ~/.jupyter/jupyter_notebook_config.py

jupyter server password
