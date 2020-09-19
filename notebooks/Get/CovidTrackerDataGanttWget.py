import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import wget
import os

rawpath = 'https://raw.githubusercontent.com/OxCGRT/covid-policy-tracker/master/data/OxCGRT_latest.csv'
filename = wget.download(rawpath)
si_detailed = pd.read_csv(filename,parse_dates=['Date'])

os.remove(filename) 

all_latest_columns_list = si_detailed.columns.tolist()
all_latest_columns_list.remove('CountryName')
all_latest_columns_list.remove('CountryCode')
all_latest_columns_list.remove('Date')
valuelist = all_latest_columns_list.copy()


idlist = ['CountryName', 'CountryCode', 'Date']

longdf = pd.melt(si_detailed, id_vars=idlist, value_vars=valuelist)

allcountrydata = longdf.copy()


# In[10]:


#cl = ukdata.columns.tolist()
rawpath = 'https://raw.githubusercontent.com/OxCGRT/covid-policy-tracker/master/documentation/codebook.md'
filename = wget.download(rawpath)


# In[11]:


f = open(filename, "r")
y = 0
z = 0
allcodebookdata = []
for x in f:
    if '### Containment and closure policies' in x:
        y = 1
    if '## Codebook changelog' in x:
        z = 1
    if y == 1:
        appendlist = x.split('|')
        allcodebookdata.append(appendlist)
#print(y,z)
allcodebookdata_df = pd.DataFrame(allcodebookdata)


# In[12]:


os.remove(filename)


# In[13]:


codebookdata_df = allcodebookdata_df[2:]
codebookdata_df 


# In[14]:


codebookdf_columns = codebookdata_df[:1]
columnslist = codebookdf_columns.values.tolist()
columnslist


# In[15]:


justlist = columnslist[0]
justlist


# In[16]:


cleancolumnlist = [x.replace(' ','') for x in justlist]
#cleancolumnlist


# In[17]:


codebookdata_df.columns = cleancolumnlist


# In[18]:


codebookdata_df = codebookdata_df[2:]
#df.head(5)


# In[19]:


#newdf = df[' Coding '].str.split('<br/>', expand=True)
Coding_df = codebookdata_df['Coding'].str.split('<br/>', expand=True)
Name_df = codebookdata_df['Name'].str.split('_', expand=True)
Joinedwithcoding_df = codebookdata_df.join(Coding_df, lsuffix='_caller', rsuffix='_other').copy()
Joinedwithname_df = Joinedwithcoding_df.join(Name_df, lsuffix='_caller', rsuffix='_other').copy()
Joinedwithname_df['ShortCode'] = Joinedwithname_df['Name'].str[:4]
Joinedwithname_df


# In[20]:


Joinedwithname_df['ShortCode'] = Joinedwithname_df['ShortCode'].str.strip(' `')
Joinedwithname_df['ShortDescription'] = Joinedwithname_df['1_other'].str.replace('`','')
Joinedwithname_df['Name'] = Joinedwithname_df['Name'].str.strip(' `')
Joinedwithname_df.columns


# In[21]:


descriptionsdf = Joinedwithname_df[['Name','ShortCode', 'ShortDescription','Description', 'Measurement']].copy()
descriptionsdf.head(25)


# In[22]:


allcoodesfor0 = Joinedwithname_df.iloc[:,7].str.split('-', expand=True).copy()
allcoodesfor1 = Joinedwithname_df.iloc[:,8].str.split('-', expand=True).copy()
allcoodesfor2 = Joinedwithname_df.iloc[:,9].str.split('-', expand=True).copy()
allcoodesfor3 = Joinedwithname_df.iloc[:,10].str.split('-', expand=True).copy()
#allcoodesfor0.columns['Category','Type','1','2']
allcoodesfor0 = allcoodesfor0.rename(columns = {0:"Category",1:"Type"}) 
allcoodesfor1 = allcoodesfor1.rename(columns = {0:"Category",1:"Type"}) 
allcoodesfor2 = allcoodesfor2.rename(columns = {0:"Category",1:"Type"}) 
allcoodesfor3 = allcoodesfor3.rename(columns = {0:"Category",1:"Type"}) 

allcoodesfor0 = allcoodesfor0[['Category','Type']]
allcoodesfor1 = allcoodesfor1[['Category','Type']]
allcoodesfor2 = allcoodesfor2[['Category','Type']]
allcoodesfor3 = allcoodesfor3[['Category','Type']]


# In[23]:


#allcoodesfor0.head(5)


# In[24]:


joineddftounion0 = descriptionsdf.join(allcoodesfor0, lsuffix='_caller', rsuffix='_other').copy()
joineddftounion1 = descriptionsdf.join(allcoodesfor1, lsuffix='_caller', rsuffix='_other').copy()
joineddftounion2 = descriptionsdf.join(allcoodesfor2, lsuffix='_caller', rsuffix='_other').copy()
joineddftounion3 = descriptionsdf.join(allcoodesfor3, lsuffix='_caller', rsuffix='_other').copy()


# In[25]:


joineddfalllist = [joineddftounion0,joineddftounion1,joineddftounion2,joineddftounion3]
joineddfall = pd.concat(joineddfalllist)


# In[26]:


joineddfall['Category'] = joineddfall['Category'].str.replace(' ','')
#joineddfall.Category.unique()


# In[27]:


#joineddfall


# In[28]:


jf = joineddfall[joineddfall['Category']=='3']
#jf


# ukdata = ukdata.rename(columns = {"variable":"Name","value":"Category"}) 
# #ukdata['CategoryAsString'] = ukdata['Category'].apply(str)
# 
# cols = ['Category']
# ukdata[cols] = ukdata[cols].applymap(lambda x: '{0:.0f}'.format(x))
# #ukdata.head(5)

# In[29]:


#allcountrydata
allcountrydata = allcountrydata.rename(columns = {"variable":"Name","value":"Category"}) 
cols = ['Category']
allcountrydata['CategoryJoin'] = allcountrydata['Category']
allcountrydata


# 

# listofcountries = ['Australia', 'Austria',
#  'Brazil', 'Barbados','Sweden',
#        'Canada', 'Switzerland', 'Chile', 'China', 
#        'Czech Republic',
#        'Germany', 'Egypt', 'Spain', 'Estonia', 'Ethiopia',
#        'Finland', 'France', 'Gabon', 'United Kingdom',  'Greece', 'Greenland', 'Guatemala', 'Guam',
#        'Guyana', 'Hong Kong', 'Honduras', 'Croatia', 'Hungary']

# In[30]:


#allcountrydata[cols] = allcountrydata[cols].applymap(lambda x: '{0:.0f}'.format(x))
#focusedcountrydata = allcountrydata[allcountrydata['CountryName'].isin(listofcountries)].copy()
#focusedcountrydata['CategoryJoin'] = focusedcountrydata['Category']
#focusedcountrydata.head()


# In[31]:


joineddfall['CategoryJoin'] = pd.to_numeric(joineddfall['Category'],errors='coerce')

joineddfall['ActivityLong'] = joineddfall['Name'] + '_' + joineddfall['Type']
#joineddfall.head()
#longlist = joineddfall.ActivityLong.unique().tolist()
#longlist_df = pd.DataFrame(data=longlist)
#longlist_df.columns=['ActivityLong']
#longlist_df.to_csv('/Users/andrewgaitskell/Documents/Dashboards/ActivityLong.csv')


# In[34]:


cwd = os.getcwd()
filename = cwd + '/data/ActivityLong.csv'
filename


# In[35]:


ActivityLong = pd.read_csv(filename)
ActivityLong


# ##rpt[rpt['STK_ID'].isin(stk_list)]
# 
# activityvalues = ActivityLong[ActivityLong['ActivityLong'].str.contains('C1_School closing_ no measures')]
# activityvalues

# In[ ]:





# In[76]:


def CreateActivity(c):
    #activityvalues = ActivityLong[c['ActivityLong'] in ActivityLong['ActivityLong']]
    retvalue = ''
    for index, row in ActivityLong.iterrows():
        #print(row['c1'], row['c2'])
        if str(row['ActivityLong']) in str(c['ActivityLong']):
            retvalue = row['Activity']
    
    #stringactivity = c['ActivityLong']
    #activityvalues = ActivityLong[ActivityLong['ActivityLong'].str.contains(stringactivity,regex=False)]
    return retvalue

def CreateActivityGroup(c):
    #activityvalues = ActivityLong[c['ActivityLong'] in ActivityLong['ActivityLong']]
    retvalue = ''
    for index, row in ActivityLong.iterrows():
        #print(row['c1'], row['c2'])
        if str(row['ActivityLong']) in str(c['ActivityLong']):
            retvalue = row['ActivityGroup']
    
    #stringactivity = c['ActivityLong']
    #activityvalues = ActivityLong[ActivityLong['ActivityLong'].str.contains(stringactivity,regex=False)]
    return retvalue

#activityvalues = ActivityLong[c['ActivityLong'] in ActivityLong['ActivityLong']]       
        
#joineddfall['Activity'] = longlist_df.apply(lambda row: CreateActivity if row.notnull().all() else 'x', axis=1)

#df.apply(lambda row: func1(row) if row.notnull().all() else func2(row), axis=1)
joineddfall['Activity'] = joineddfall.apply(CreateActivity, axis=1)
joineddfall['ActivityGroup'] = joineddfall.apply(CreateActivityGroup, axis=1)
#joineddfall


# In[77]:


resultcountries = pd.merge(allcountrydata,
                 joineddfall,
                 on=['Name','CategoryJoin'], 
                 how='left')
#resultcountries


# In[78]:


#result = result.set_index('Date')
#result.Category.unique()
#resultallcountry['CategoryAsNumber'] = pd.to_numeric(resultallcountry['Category'],errors='coerce')
#c1result = result[result['Name']=='C1_School closing'].copy()
#c1result.head(25)
#c1result['CategoryAsNumber'] = pd.to_numeric(c1result['Category'],errors='coerce')
#resultfocussedcountries.Name.unique()


# restricted = ['C1_School closing', 'C1_Flag', 'C2_Workplace closing', 'C2_Flag',
#        'C3_Cancel public events', 'C3_Flag',
#        'C4_Restrictions on gatherings', 'C4_Flag',
#        'C5_Close public transport', 'C5_Flag',
#        'C6_Stay at home requirements', 'C6_Flag',
#        'C7_Restrictions on internal movement', 'C7_Flag',
#        'C8_International travel controls']
# 
# resulttoplot = resultfocussedcountries[resultfocussedcountries['Name'].isin(restricted)].copy()
# #resulttoplot

# In[79]:


resulttoplot = resultcountries.copy()


# In[80]:


df = resulttoplot.sort_values(by = ['CountryCode','Name', 'Date'], ascending = [True, True, True]).copy()
df['prev_name'] = df.Name.shift(1)
df['prev_category'] = df.CategoryJoin.shift(1)
