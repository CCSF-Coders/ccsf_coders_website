#!/bin/sh
echo "-----------------------"
echo "Fixing file permissions"
chmod 644 img/*
chmod 644 scripts/*
chmod 644 styles/*
chmod 644 partials/*
chmod 644 templates/*
chmod 644 index.html
echo "index.html and all files in img/, scripts/, styles/, partials/, templates/ have permission 644 now."
echo ""
echo "Fixing folder permissions"
chmod 755 img/
chmod 755 scripts/
chmod 755 styles/
chmod 755 partials/
chmod 755 templates/
chmod 755 .
echo "Folders img/, scripts/, styles/, partials/, templates/ and public_html/ have permission 755 now."
echo "-----------------------"
