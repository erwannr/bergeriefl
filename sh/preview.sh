input="../pdf/assemble.pdf"
output_dir="../preview"
[[ -d "$output_dir" ]] || { mkdir "$output_dir"; }
magick -density 300 -colorspace sRGB "$input" -alpha remove -alpha off "$output_dir/assemble.png"

[[ -d "../html" ]] || { mkdir '../html'; }
pandoc ../README.md -o ../html/README.html --standalone
sed -i 's|src="\./preview/|src="../preview/|g' '../html/README.html'
