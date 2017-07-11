FROM artemklevtsov/r-alpine:3.3.1

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="0.4"
LABEL version="0.3"
LABEL software="mtbls-factor-vis"
LABEL base.image="artemklevtsov/r-alpine:3.3.1"
LABEL description="An R-based depiction for factors and their values in MetaboLights studies"
LABEL website="https://github.com/phnmnl/container-mtbls-factors-viz"
LABEL documentation="https://github.com/phnmnl/container-mtbls-factors-viz"
LABEL license="https://github.com/phnmnl/container-mtbls-factors-viz"
LABEL tags="Metabolomics"

RUN R -e "install.packages(c('data.table','optparse','jsonlite','ggparallel'))"

ADD makeParallelCoordsPlot.R /usr/local/bin/makeParallelCoordsPlot.R
ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod a+x /usr/local/bin/runTest1.sh
RUN chmod a+x /usr/local/bin/makeParallelCoordsPlot.R

ENTRYPOINT ["makeParallelCoordsPlot.R"]
