#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re
import shutil
import argparse

BACKUP_DIR = os.path.dirname(os.path.realpath(__file__))
# BACKUP_DIR = os.getcwd()
HOME_DIR = os.getenv('HOME')

CONF_GROUP_0 = (
    '.ocamlinit',
    '.bashrc', '.bash_profile',
    '.vimrc', '.gvimrc',
    '.fbtermrc', '.tmux.conf',
    '.gemrc', '.npmrc',
    '.gitconfig', '.hgrc',
    '.mpdconf',
    '.pylintrc',
    '.racketrc', '.reducerc',
    '.vimperatorrc.local',
    '.xinitrc', '.xprofile', '.Xresources',
    '.zlogin', '.zprofile', '.zshrc',
)

CONF_GROUP_1 = (
    '.mplayer/config',
    '.cargo/config',
    '.gnupg/gpg.conf',
    '.gnupg/gpg-agent.conf',
    '.ipython/extensions/version_information.py',
)

CONF_GROUP_2 = (
    '.config/pip/pip.conf',
    '.config/mpv/mpv.conf',
    '.config/rslsync/rslsync.conf',
    '.config/yay/config.json',
)


def backup(src_dir=HOME_DIR, dst_dir=BACKUP_DIR):
    for conf in CONF_GROUP_0:
        src = os.path.join(src_dir, conf)
        dst = os.path.join(dst_dir, conf.lstrip('.'))
        if os.path.exists(src):
            shutil.copy(src, dst)

    for conf in CONF_GROUP_1:
        src = os.path.join(src_dir, conf)
        dst = os.path.join(dst_dir, conf.lstrip('.'))
        if os.path.exists(src):
            os.makedirs(os.path.dirname(dst), mode=0o755, exist_ok=True)
            shutil.copy(src, dst)

    for conf in CONF_GROUP_2:
        src = os.path.join(src_dir, conf)
        dst = os.path.join(dst_dir, re.sub(r'^.*?/', '', conf))
        if os.path.exists(src):
            os.makedirs(os.path.dirname(dst), mode=0o755, exist_ok=True)
            shutil.copy(src, dst)


def restore():
    raise NotImplementedError('restore')


class MyParser(argparse.ArgumentParser):

    def __init__(self):
        description = 'Backup dot files or restore for backups'
        super().__init__(description=description)
        self.add_argument('--restore', action='store_true',
                          help='restore from backups')


def main():
    myparser = MyParser()
    args = myparser.parse_args()

    if args.restore:
        restore()
    else:
        backup()


if __name__ == '__main__':
    main()
