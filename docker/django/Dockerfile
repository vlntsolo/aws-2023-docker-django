FROM amazonlinux:2023
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV APP_HOME /app
ENV PYTHONPATH=${PYTHONPATH}:${PWD} 
ENV PYTHONFAULTHANDLER 1
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Install pipenv and compilation dependencies
# install[] dependencies
RUN dnf update
RUN dnf -y install python3.11 python3-pip pango gcc python3-devel gcc-c++ zlib-devel libjpeg-devel openjpeg2-devel libffi-devel
#gcc tar pkgconf-pkg-config make cmake pango-devel pango cairo-devel cairo
# dnf-plugins-core
# RUN dnf install -y poppler poppler-devel poppler-cpp poppler-cpp-devel g++ make wget tar pkgconf-pkg-config pango-devel pango cairo-devel cairo icu libicu-devel libicu cmake libjpeg-turbo libjpeg-turbo-devel libtiff libtiff-devel libpng libpng-devel
# ca-certificates gcc postgresql-dev linux-headers musl-dev libffi-dev jpeg-dev zlib-dev \
RUN dnf clean all
RUN pip3 install pipenv

# Install python dependencies in /.venv
COPY Pipfile .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy --skip-lock

ENV PATH="/.venv/bin:$PATH"

# set work directory
RUN mkdir /app
# RUN /usr/sbin/useradd addgroup --system app && adduser --system --group app
WORKDIR $APP_HOME

COPY . ./

EXPOSE 8000

CMD ["gunicorn", "core.wsgi:application", "--bind", ":8000"]