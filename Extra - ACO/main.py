from PyQt5.uic import loadUi
from PyQt5.QtGui import QIcon
from PyQt5.QtWidgets import QApplication,QMainWindow,QMessageBox
import pandas as pd
import random as rd
import numpy as np
import math

class MatplotlibWidget(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        loadUi("interfaz.ui", self)
        self.setWindowTitle("ACO")#cabecera de la interfaz
        self.setWindowIcon(QIcon('icono3.jpg'))
        self.pushButton1.clicked.connect(self.simular)
        self.pushButton2.clicked.connect(self.limpiar)
        self.comboBox.activated.connect(self.desactivar_checkbox)
        self.comboBox.clear()
        c = ['',
            'Ciudad1',
            'Ciudad2',
            'Ciudad3',
            'Ciudad4',
            'Ciudad5',
            'Ciudad6',
            'Ciudad7',
            'Ciudad8',
            'Ciudad9',
            'Ciudad10',
            'Ciudad11',
            'Ciudad12',
            'Ciudad13',
            'Ciudad14',
            'Ciudad15',
            'Ciudad16',
            'Ciudad17',
            'Ciudad18',
            'Ciudad19']
        self.comboBox.addItems(c)

    def grafica(self, coordenadas, ruta):
        self.MplWidget.canvas.axes.clear()
        x = [float(coordenadas[i][1]) for i in ruta]
        x.append(x[0])
        y = [float(coordenadas[i][2]) for i in ruta]
        y.append(y[0])
        self.MplWidget.canvas.axes.plot(x, y, linewidth = 1, color='tab:red')
        self.MplWidget.canvas.axes.scatter(x, y, s = 4 * math.pi, color = 'tab:green')
        for i in ruta:
            c = (float(coordenadas[i][1]), float(coordenadas[i][2]))
            for j, k in enumerate(coordenadas):
                if i == j:
                    self.MplWidget.canvas.axes.annotate(k[0], c, size= 8)
        self.MplWidget.canvas.draw()

    def alertas(self, texto):
        msgBox = QMessageBox()
        msgBox.setIcon(QMessageBox.Information)
        msgBox.setText(texto)
        msgBox.setWindowTitle("AVISO")
        msgBox.setStandardButtons(QMessageBox.Ok | QMessageBox.Cancel)
        msgBox.buttonClicked.connect(self.msgButtonClick)
        returnValue = msgBox.exec()
        if returnValue == QMessageBox.Ok:
            print('OK clicked')

    def msgButtonClick(self, i):
        print("Button clicked is:",i.text())

    def desactivar_checkbox(self):
        ciudad_1 = str(self.comboBox.currentText())
        if ciudad_1 == 'Ciudad1':
            self.checkBox.setEnabled(False)
        elif ciudad_1 == 'Ciudad2':
            self.checkBox_5.setEnabled(False)
        elif ciudad_1 == 'Ciudad3':
            self.checkBox_4.setEnabled(False)
        elif ciudad_1 == 'Ciudad4':
            self.checkBox_3.setEnabled(False)
        elif ciudad_1 == 'Ciudad5':
            self.checkBox_2.setEnabled(False)
        elif ciudad_1 == 'Ciudad6':
            self.checkBox_6.setEnabled(False)
        elif ciudad_1 == 'Ciudad7':
            self.checkBox_8.setEnabled(False)
        elif ciudad_1 == 'Ciudad8':
            self.checkBox_9.setEnabled(False)
        elif ciudad_1 == 'Ciudad9':
            self.checkBox_10.setEnabled(False)
        elif ciudad_1 == 'Ciudad10':
            self.checkBox_11.setEnabled(False)
        elif ciudad_1 == 'Ciudad11':
            self.checkBox_12.setEnabled(False)
        elif ciudad_1 == 'Ciudad12':
            self.checkBox_13.setEnabled(False)
        elif ciudad_1 == 'Ciudad13':
            self.checkBox_15.setEnabled(False)
        elif ciudad_1 == 'Ciudad14':
            self.checkBox_13.setEnabled(False)
        elif ciudad_1 == 'Ciudad15':
            self.checkBox_19.setEnabled(False)
        elif ciudad_1 == 'Ciudad16':
            self.checkBox_18.setEnabled(False)
        elif ciudad_1 == 'Ciudad17':
            self.checkBox_16.setEnabled(False)
        elif ciudad_1 == 'Ciudad18':
            self.checkBox_20.setEnabled(False)
        else:
            self.checkBox_21.setEnabled(False)

    def limpiar(self):
        self.lineEdit_4.clear()
        self.doubleSpinBox_2.setValue(0)
        self.doubleSpinBox_3.setValue(0)
        self.doubleSpinBox_4.setValue(0)
        self.doubleSpinBox_5.setValue(0)
        self.spinBox.setValue(0)
        self.checkBox.setChecked(False)
        self.checkBox_5.setChecked(False)
        self.checkBox_4.setChecked(False)
        self.checkBox_3.setChecked(False)
        self.checkBox_2.setChecked(False)
        self.checkBox_6.setChecked(False)
        self.checkBox_8.setChecked(False)
        self.checkBox_9.setChecked(False)
        self.checkBox_10.setChecked(False)
        self.checkBox_11.setChecked(False)
        self.checkBox_12.setChecked(False)
        self.checkBox_14.setChecked(False)
        self.checkBox_15.setChecked(False)
        self.checkBox_13.setChecked(False)
        self.checkBox_19.setChecked(False)
        self.checkBox_18.setChecked(False)
        self.checkBox_16.setChecked(False)
        self.checkBox_20.setChecked(False)
        self.checkBox_21.setChecked(False)
        self.checkBox.setEnabled(True)
        self.checkBox_5.setEnabled(True)
        self.checkBox_4.setEnabled(True)
        self.checkBox_3.setEnabled(True)
        self.checkBox_2.setEnabled(True)
        self.checkBox_6.setEnabled(True)
        self.checkBox_8.setEnabled(True)
        self.checkBox_9.setEnabled(True)
        self.checkBox_10.setEnabled(True)
        self.checkBox_11.setEnabled(True)
        self.checkBox_12.setEnabled(True)
        self.checkBox_14.setEnabled(True)
        self.checkBox_15.setEnabled(True)
        self.checkBox_13.setEnabled(True)
        self.checkBox_19.setEnabled(True)
        self.checkBox_18.setEnabled(True)
        self.checkBox_16.setEnabled(True)
        self.checkBox_20.setEnabled(True)
        self.checkBox_21.setEnabled(True)
        self.lineEdit_5.clear()
        self.lineEdit_3.clear()
        self.lineEdit.clear()
        self.lineEdit_7.clear()
        self.textEdit.clear()
        self.lineEdit_2.clear()
        self.lineEdit_6.clear()
        self.comboBox.clear()
        c = ['',
        'Ciudad1',
            'Ciudad2',
            'Ciudad3',
            'Ciudad4',
            'Ciudad5',
            'Ciudad6',
            'Ciudad7',
            'Ciudad8',
            'Ciudad9',
            'Ciudad10',
            'Ciudad11',
            'Ciudad12',
            'Ciudad13',
            'Ciudad14',
            'Ciudad15',
            'Ciudad16',
            'Ciudad17',
            'Ciudad18',
            'Ciudad19']
        self.comboBox.addItems(c)
        self.MplWidget.canvas.axes.clear()
        self.MplWidget.canvas.draw()
        return 1

    def extraerCiudades(self):
        ciudad_1 = str(self.comboBox.currentText())
        print(ciudad_1)
        lista = [
        ['Ciudad1',  self.checkBox.isChecked()],
        ['Ciudad2', self.checkBox_5.isChecked()],
        ['Ciudad3', self.checkBox_4.isChecked()],
        ['Ciudad4', self.checkBox_3.isChecked()],
        ['Ciudad5', self.checkBox_2.isChecked()],
        ['Ciudad6', self.checkBox_6.isChecked()],
        ['Ciudad7', self.checkBox_8.isChecked()],
        ['Ciudad8', self.checkBox_9.isChecked()],
        ['Ciudad9', self.checkBox_10.isChecked()],
        ['Ciudad10', self.checkBox_11.isChecked()],
        ['Ciudad11', self.checkBox_12.isChecked()],
        ['Ciudad12', self.checkBox_14.isChecked()],
        ['Ciudad13', self.checkBox_15.isChecked()],
        ['Ciudad14', self.checkBox_13.isChecked()],
        ['Ciudad15', self.checkBox_19.isChecked()],
        ['Ciudad16', self.checkBox_18.isChecked()],
        ['Ciudad17', self.checkBox_16.isChecked()],
        ['Ciudad18', self.checkBox_20.isChecked()],
        ['Ciudad19', self.checkBox_21.isChecked()],
        ]
        for i in range(len(lista)):#para descativar check de ciudad elegida

            if ciudad_1 == lista[i][0]:
                print(lista[i][0])
                lista[i][1] = False

        lista.insert(0, [ciudad_1, True])
        print(lista)
        return lista

    def simular(self):
        hormigas = self.lineEdit_4.text()
        if hormigas.isdigit():
            # Capturar parametros
            hormigas = int(hormigas)
            tao = self.doubleSpinBox_5.text()
            alfa = self.doubleSpinBox_2.text()
            beta = self.doubleSpinBox_3.text()
            rho = self.doubleSpinBox_4.text()
            iteracciones = self.spinBox.text()

            # Extraemos todas las ciudades y coordenadas del excel
            coordenadas_ciudades = self.leerExcel()
            # Revisamos cuales ciudades fueron seleccionadas
            ciudades_elegidas = self.extraerCiudades()
            # Escogemos las ciudades y coordenadas solo de las que fueron seleccionadas
            lista_ciudades = self.filtrarCiudades(coordenadas_ciudades, ciudades_elegidas)
            
            if len(lista_ciudades) >= hormigas:
                # Creamos una Matriz de distancias entre las ciudades
                matriz_ciudades = self.matrizDistancia(lista_ciudades)
                # Aplicamos el algoritmo
                distancia, lista_ruta, ruta = self.aco(lista_ciudades, matriz_ciudades, hormigas, alfa, beta, rho, iteracciones, tao)
                
                self.lineEdit_5.setText(distancia + ' Km')
                self.textEdit.setText(ruta)
                self.grafica(lista_ciudades, lista_ruta)
                self.lineEdit.setText(alfa)
                self.lineEdit_7.setText(beta)
                self.lineEdit_3.setText(rho)
                self.lineEdit_2.setText(iteracciones)
                self.lineEdit_6.setText(tao)
            else:
                self.alertas('Número de ciudades debe superar el número de hormigas')
                print('Error: Número de ciudades debe superar el número de hormigas')
        else:
            self.alertas('Ingresar número de hormigas correctas')
            print('Ingresar número de hormigas correctas')

    def leerExcel(self):
        df = pd.read_excel(r'coordenadas.xlsx')
        global lista
        lista = []
        for i in df.index:
            lista.append((df['Ciudad'][i], df['Latitud'][i], df['Longitud'][i]))
        return lista

    def filtrarCiudades(self, coordenadas_ciudades, ciudades): #funcion que filtra solo las ciudades seleccionadas
        lista = []
        for ciudad in ciudades:
            if ciudad[1] == True:
                for i in coordenadas_ciudades:
                    if ciudad[0] == i[0]:
                        lista.append(i)
        return lista

    def distancia(self, lat1, lon1, lat2, lon2):
        """
        Obtiene la distancia y el angulo (acimut) entre entre dos puntos de
        coordenadas geograficas P1 a P2
        """
        #  Conversion de GMS a DEC y posteriormente a radianes
        lat1rad = math.radians(lat1)
        lon1rad = math.radians(lon1)
        lat2rad = math.radians(lat2)
        lon2rad = math.radians(lon2)
        #  Calculo de la distancia P1 a P2
        a = math.sin(lat1rad)*math.sin(lat2rad)
        b = math.cos(lat1rad)*math.cos(lat2rad)*math.cos(lon2rad - lon1rad)
        D = math.acos(a + b)  # Formula (2)
        d = 111.18*math.degrees(D)  # Formula (1)
        # Regresa distancia y angulo
        return round(d, 2)

    def matrizDistancia(self, lista):
        matriz = []
        for i in range(len(lista)):
            m = []
            for j in range(len(lista)):
                if i == j:
                    d = 0.0
                else:
                    d = self.distancia(lista[i][1], lista[i][2], lista[j][1], lista[j][2])
                m.append(d)
            matriz.append(m)
        return matriz

    def lengthCal(self, camino_hormiga, distmat):         #Calcular distancia
        length =[]
        dis = 0
        for i in range(len(camino_hormiga)):
            for j in range(len(camino_hormiga[i]) - 1):
                dis += distmat[camino_hormiga[i][j]][camino_hormiga[i][j + 1]]  #[2, 1 ]
            dis += distmat[camino_hormiga[i][-1]][camino_hormiga[i][0]]
            length.append(dis)
            dis = 0
        return length

    def aco(self,lista_ciudades , matriz_distancia, num_horm, alfa, beta, rho, iteracciones, tao):

        distmat = np.array(matriz_distancia)

        antNum = int(num_horm)     # Número de hormiga
        alpha = int(float(alfa))   # Factor de importancia de las feromonas
        beta = int(float(beta))    # Factor de importancia de la función heurística
        pheEvaRate = float(rho)    # Tasa de evaporación de feromonas
        cityNum = distmat.shape[0]
        tao = np.asarray(tao, dtype='float64')
        pheromone = np.ones((cityNum,cityNum)) * tao                                # Creamos una Matriz de feromonas
        heuristic = 1 / (np.eye(cityNum) + distmat) - np.eye(cityNum)               # Matriz de información heurística, tome 1 / dismat
        iter = 1
        itermax = int(iteracciones)

        while iter < itermax:                                                       # Para cada generacion
            antPath = np.zeros((antNum, cityNum)).astype(int) - 1                   # Creamos una matriz para el camino de las hormigas
            first = self.comboBox.currentText()
            firstCity = [0 for i in range(cityNum)]
            unvisted = []
            p = []
            pAccum = 0
            for i in range(len(antPath)):
                antPath[i][0] = firstCity[i]                                        # Asignamos a cada hormiga una ciudad de inicio
            for i in range(len(antPath[0]) - 1):                                    # Actualiza gradualmente la próxima ciudad a la que irá cada hormiga
                for j in range(len(antPath)):
                    for k in range(cityNum):
                        if k not in antPath[j]:
                            unvisted.append(k)                                      # Se agregan las ciudades que no han sido visitadas
                    for m in unvisted:
                        pAccum += pheromone[antPath[j][i]][m] ** alpha * heuristic[antPath[j][i]][m] ** beta         #Calculamos sumatoria de feromonas de los caminos que se han visitado
                    for n in unvisted:
                        p.append(pheromone[antPath[j][i]][n] ** alpha * heuristic[antPath[j][i]][n] ** beta / pAccum)#Calculamos porcentaje de feromonas de los caminos que se han visitado
                    roulette = np.array(p).cumsum()                                 # Generar una ruleta deacuerdo al porcentaje de feromonas
                    r = rd.uniform(min(roulette), max(roulette))
                    for x in range(len(roulette)):
                        if roulette[x] >= r:                                        # Utilizamos el método de la ruleta para elegir la próxima ciudad para ir
                            antPath[j][i + 1] = unvisted[x]
                            break
                    unvisted = []
                    p = []
                    pAccum = 0
            pheromone = (1 - pheEvaRate) * pheromone                                # Se volatilizan las Feromonas
            length = self.lengthCal(antPath,distmat)
            for i in range(len(antPath)):
                for j in range(len(antPath[i]) - 1):
                    pheromone[antPath[i][j]][antPath[i][j + 1]] += 1 / length[i]    # Actualizamos las feromonas en el camino de las hormigas
                pheromone[antPath[i][-1]][antPath[i][0]] += 1 / length[i]
            iter += 1
        
        print("La distancia más corta es:")
        distancia = str(round(min(length), 2))

        print("El camino más corto es:")
        print(antPath[length.index(min(length))])

        ruta = list(antPath[length.index(min(length))])
        lista_ruta = [int(x) for x in ruta]
        ciudad_ruta = []
        ciudad_ruta1 = []
        for i in ruta:
            for j, k in enumerate(lista_ciudades):
                if i == j:
                    ciudad_ruta.append(str(k[0]))
        ciudad_ruta1 = ciudad_ruta.append(first)
        ciudad_ruta= ' -> '.join(ciudad_ruta)
        res = (distancia, lista_ruta, ciudad_ruta)
        return res

app = QApplication([])
window = MatplotlibWidget()
window.show()
app.exec_()