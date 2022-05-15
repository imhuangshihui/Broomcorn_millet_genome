import matplotlib.pyplot as plt
def insertion(files):
    ax = plt.axes([0.6,0.12,0.4,0.8],xlim=([0,1]),ylim=([0,15]))
    plt.axis('off')
    #ax.invert_xaxis()
    y = 1
    with open(files)as fin:
        for i in fin.readlines()[1:]:
            n,va,pr = i.strip().split('\t')
            print(pr)
            ax.add_patch(plt.Rectangle((0,y),(eval(pr.replace('%',''))/100),0.7,alpha=0.5,color='#{}'.format(dco[n])))
            y+=1
def deletion(files):
    ax = plt.axes([0,0.12,0.4,0.8],xlim=([0,1]),ylim=([0,15]))
    plt.axis('off')
    ax.invert_xaxis()
    y = 1
    with open(files)as fin:
        for i in fin.readlines()[1:]:
            n,va,pr = i.strip().split('\t')
            print(pr)
            ax.add_patch(plt.Rectangle((0,y),(eval(pr.replace('%',''))/100),0.7,alpha=0.5,color='#{}'.format(dco[n])))
            y+=1
def name(files):
    ax = plt.axes([0.4,0.12,0.2,0.8],xlim=([0,1]),ylim=([0,15]))
    plt.axis('off')
    y = 1
    with open(files)as fin:
        for i in fin.readlines()[1:]:
            n,va,pr = i.strip().split('\t')
            plt.text(0.5,y+0.1,n,horizontalalignment='center',family="Times new roman",size=12,color='#{}'.format(dco[n]))
            y+=1
dco={'DNA/DTA':'ffad76','DNA/DTC':'f75f14','DNA/DTH':'f38921','DNA/DTM':'d86b00','DNA/DTT':'fdaf27','DNA/Helitron':'fa7551','MITE/DTA':'adfe80','MITE/DTC':'61c729','MITE/DTH':'1dc910','MITE/DTM':'37b755','MITE/DTT':'3ae41e','LTR/Gypsy':'26ecbb','LTR/Copia':'11f5f2','LTR/unknown':'11cdf5'}

plt.rcParams['font.sans-serif'] = 'times new roman'
ax2=plt.axes([0.6,0.17,0.4,0.8],xlim=([0,1]))
ax2.spines['top'].set_visible(False)
ax2.spines['right'].set_visible(False)
ax2.spines['bottom'].set_visible(False)
ax2.spines['left'].set_visible(False)
ax2.set_xticks([0,0.2,0.4,0.6])
ax2.set_xticklabels(['0%','20%','40%','60%'])
ax2.set_yticks([])
ax2=plt.axes([0,0.17,0.4,0.8],xlim=([0,1]))
ax2.spines['top'].set_visible(False)
ax2.spines['right'].set_visible(False)
ax2.spines['bottom'].set_visible(False)
ax2.spines['left'].set_visible(False)
ax2.set_xticks([1,0.8,0.6,0.4])
ax2.set_xticklabels(['0%','20%','40%','60%'])
ax2.set_yticks([])
#plt.xticks(rotation=90)
#ax=plt.axes([0.11, 0.18,0.8,0.8],xlim=([-1,58]))
#ax.spines['top'].set_visible(False)
#ax.spines['right'].set_visible(False)
#ax.spines['bottom'].set_visible(False)
#ax.spines['left'].set_visible(False)
insertion('C:\\Users\\WZH\\Desktop\\LMPM_Insertion_SVs_CI_above500_edta.out')
deletion('C:\\Users\\WZH\\Desktop\\LMPM_Deletion_SVs_above500_edta.out')
name('C:\\Users\\WZH\\Desktop\\LMPM_Insertion_SVs_CI_above500_edta.out')
plt.show()