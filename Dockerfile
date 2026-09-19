FROM lscr.io/linuxserver/code-server:latest

USER root

RUN apt-get update && \
    apt-get install -y \
    curl \
    ca-certificates \
    gnupg \
    git \
    sudo \
    python3 \
    python3-pip \
    python3-venv \
    build-essential \
    unzip \
    jq \
    && rm -rf /var/lib/apt/lists/*

RUN echo "abc ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/abc && \
    chmod 0440 /etc/sudoers.d/abc

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g pnpm
RUN curl -fsSL https://claude.ai/install.sh | bash
# Claude Code
RUN curl -fsSL https://claude.ai/install.sh | bash && \
    cp -L /root/.local/bin/claude /usr/local/bin/claude && \
    chmod +x /usr/local/bin/claude
WORKDIR /projects
