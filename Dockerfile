FROM php:7.3.13-fpm

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt upgrade -y --no-install-recommends && \
    apt autoremove -y && \
    apt install -y --no-install-recommends apt-utils debconf

RUN apt install -y --no-install-recommends \
        docker.io \
        fontconfig \
        git \
        graphviz \
        libjpeg62-turbo \
        libpng-dev \
        libx11-6 \
        libxcb1 \
        libxext6 \
        libxrender1 \
        libzip-dev \
        locales \
        nodejs \
        sudo \
        xfonts-75dpi \
        xfonts-base \
        xfonts-utils \
        unzip \
        wget \
        zsh \
        zip && \
    chsh -s /usr/bin/zsh root && \
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    ln -fs /var/www/html/sf4/.docker/php/.bash_aliases ~/.bash_aliases && \
    ln -fs /var/www/html/sf4/.docker/php/.bashrc ~/.bashrc && \
    ln -fs /var/www/html/sf4/.docker/php/.zshrc-root ~/.zshrc && \
    docker-php-ext-install \
        calendar \
        gd \
        pdo_mysql \
        zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    wget https://get.symfony.com/cli/installer -O - | bash && \
    mv /root/.symfony/bin/symfony /usr/local/bin/symfony &&\
    rm -r /root/.symfony/ && \
    curl https://www.npmjs.com/install.sh | sh && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen && \
    wget --no-check-certificate https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    dpkg -i "wkhtmltox_0.12.5-1.stretch_amd64.deb" && \
    apt-get -f install && \
    apt upgrade -y --no-install-recommends && \
    apt autoclean -y && \
    apt autoremove -y && \
    ln -fs /var/www/html/sf4/.docker/php/php.ini /usr/local/etc/php/php.ini && \
    ln -fs /var/www/html/sf4/.docker/php/php-fpm.conf /usr/local/etc/php/php-fpm.conf && \
    echo 'root:root' | chpasswd # Mot de passe root : root

WORKDIR /var/www/html
