# GenKI (Gene Knock-out Inference)
A VGAE (Variational Graph Auto-Encoder) based model to learn perturbation using scRNA-seq data. <br>
<span style="color:red;">New!</span> Data has been added. <br>
[Paper](https://doi.org/10.1093/nar/gkad450)
<br/>
<p align="center">
    <img src="logo.jpg" alt="drawing" width="300"/>
</p>
<br/>

### Install GenKI with `Docker`
Install `Docker` for your OS (Linux/MacOS/Windows) and then run :
```shell
docker build -t genki . && docker run genki
```
### Install dependencies
Fist install dependencies of GenKI with `conda`:
```shell
conda env create -f environment.yml
conda activate ogenki
```
Install `torch_geometric` following the document:<br>
https://pytorch-geometric.readthedocs.io/en/latest/notes/installation.html

### Install GenKI with `pip`:
```shell
pip install git+https://github.com/yjgeno/GenKI.git
```
or install it manually from source:
```shell
git clone https://github.com/yjgeno/GenKI.git
cd GenKI
pip install .
```
#### Tutorial
Virtual KO experiment:<br> https://github.com/yjgeno/GenKI/blob/master/notebook/Example.ipynb <br>
