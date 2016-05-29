#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import shutil
import argparse

backup_dir = os.path.dirname(os.path.realpath(__file__))
# backup_dir = os.getcwd()
home_dir = os.getenv('HOME')

conf_group_0 = (
    '.bashrc', '.bash_profile',
    '.fbtermrc', '.tmux.conf',
    '.gemrc', '.npmrc',
    '.gitconfig', '.hgrc',
    '.mpdconf',
    '.pylintrc',
    '.racketrc',
    '.vimperatorrc.local',
    '.xinitrc', '.xprofile', '.Xresources',
    '.zlogin', '.zprofile', '.zshrc',
)

conf_group_1 = (
    '.mplayer/config',
    '.cargo/config',
    '.gnupg/gpg.conf',
    '.gnupg/gpg-agent.conf',
    '.pip/pip.conf',
    '.ipython/extensions/version_information.py',
)

conf_group_2 = (
    ('.config/mpv/mpv.conf', 'mpv/mpv.conf'),
)


def backup(src_dir=home_dir, dst_dir=backup_dir):
    for conf in conf_group_0:
        src = os.path.join(src_dir, conf)
        dst = os.path.join(dst_dir, conf.lstrip('.'))
        shutil.copy(src, dst)

    for conf in conf_group_1:
        src = os.path.join(src_dir, conf)
        dst = os.path.join(dst_dir, conf.lstrip('.'))
        os.makedirs(os.path.dirname(dst), mode=0o755, exist_ok=True)
        shutil.copy(src, dst)

    for conf in conf_group_2:
        src = os.path.join(src_dir, conf[0])
        dst = os.path.join(dst_dir, conf[1])
        os.makedirs(os.path.dirname(dst), mode=0o755, exist_ok=True)
        shutil.copy(src, dst)


def restore():
    pass


class MyParser(argparse.ArgumentParser):

    def __init__(self):
        description = 'Backup dot files or restore for backups'
        super().__init__(description=description)
        self.add_argument('--restore', action='store_true', dest='isrestore',
                          help='restore from backups')


def main():
    myparser = MyParser()
    args = myparser.parse_args()

    if args.isrestore:
        restore()
    else:
        backup()


if __name__ == '__main__':
    main()
