FROM artemklevtsov/r-alpine:3.3.1

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="0.2"
LABEL version="0.2"
LABEL software=mtbls-factor-vis

RUN R -e "install.packages(c('data.table','optparse','jsonlite','ggparallel'))"

ADD makeParallelCoordsPlot.R /usr/local/bin/makeParallelCoordsPlot.R
ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod a+x /usr/local/bin/runTest1.sh
RUN chmod a+x /usr/local/bin/makeParallelCoordsPlot.R

ENTRYPOINT ["makeParallelCoordsPlot.R"]
