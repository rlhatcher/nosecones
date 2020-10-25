FROM jupyter/scipy-notebook:feacdbfc2e89

USER root
RUN apt-get update && apt-get install -y openscad

USER $NB_UID

RUN pip install viewscad numpy nbinteract ipywidgets

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
