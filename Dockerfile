FROM docker.io/opensuse/tumbleweed:latest

RUN zypper install -y curl git \
    && git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0 \
    && zypper clean -a

RUN export ASDF_DIR="$HOME/.asdf" \
    && . "$HOME/.asdf/asdf.sh"  \
    &&  asdf install erlang 26.2.1 \
    &&    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git  \
    && https://raw.githubusercontent.com/crownedgrouse/kerl/c841bdc592c89ed800f4fc46a3c1e744b96c1fe4/kerl -o /root/.asdf/plugins/erlang/kerl \
    && chmod +x /root/.asdf/plugins/erlang/kerl \


    CMD [ "bash" ]