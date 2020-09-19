[NbConvertApp] Converting notebook /home/ubuntu/voila/notebooks/Get/CovidTrackerDataGanttWget.ipynb to notebook
[NbConvertApp] Executing notebook with kernel: python3
[NbConvertApp] ERROR | Error while converting '/home/ubuntu/voila/notebooks/Get/CovidTrackerDataGanttWget.ipynb'
Traceback (most recent call last):
  File "/usr/local/lib/python3.6/dist-packages/nbconvert/nbconvertapp.py", line 410, in export_single_notebook
    output, resources = self.exporter.from_filename(notebook_filename, resources=resources)
  File "/usr/local/lib/python3.6/dist-packages/nbconvert/exporters/exporter.py", line 179, in from_filename
    return self.from_file(f, resources=resources, **kw)
  File "/usr/local/lib/python3.6/dist-packages/nbconvert/exporters/exporter.py", line 197, in from_file
    return self.from_notebook_node(nbformat.read(file_stream, as_version=4), resources=resources, **kw)
  File "/usr/local/lib/python3.6/dist-packages/nbconvert/exporters/notebook.py", line 32, in from_notebook_node
    nb_copy, resources = super(NotebookExporter, self).from_notebook_node(nb, resources, **kw)
  File "/usr/local/lib/python3.6/dist-packages/nbconvert/exporters/exporter.py", line 139, in from_notebook_node
    nb_copy, resources = self._preprocess(nb_copy, resources)
  File "/usr/local/lib/python3.6/dist-packages/nbconvert/exporters/exporter.py", line 316, in _preprocess
    nbc, resc = preprocessor(nbc, resc)
  File "/usr/local/lib/python3.6/dist-packages/nbconvert/preprocessors/base.py", line 47, in __call__
    return self.preprocess(nb, resources)
  File "/usr/local/lib/python3.6/dist-packages/nbconvert/preprocessors/execute.py", line 405, in preprocess
    nb, resources = super(ExecutePreprocessor, self).preprocess(nb, resources)
  File "/usr/local/lib/python3.6/dist-packages/nbconvert/preprocessors/base.py", line 69, in preprocess
    nb.cells[index], resources = self.preprocess_cell(cell, resources, index)
  File "/usr/local/lib/python3.6/dist-packages/nbconvert/preprocessors/execute.py", line 448, in preprocess_cell
    raise CellExecutionError.from_cell_and_msg(cell, out)
nbconvert.preprocessors.execute.CellExecutionError: An error occurred while executing the following cell:
------------------
resultcountries = pd.merge(allcountrydata,
                 joineddfall,
                 on=['Name','CategoryJoin'], 
                 how='left')
#resultcountries
------------------

88     return op.get_result()
/usr/local/lib/python3.6/dist-packages/pandas/core/reshape/merge.py in __init__(self, left, right, how, on, left_on
, right_on, axis, left_index, right_index, sort, suffixes, copy, indicator, validate)
    629         # validate the merge keys dtypes. We may need to coerce
    630         # to avoid incompat dtypes
--> 631         self._maybe_coerce_merge_keys()
    632 
    633         # If argument passed to validate,
/usr/local/lib/python3.6/dist-packages/pandas/core/reshape/merge.py in _maybe_coerce_merge_keys(self)
   1144                     inferred_right in string_types and inferred_left not in string_types
   1145                 ):
-> 1146                     raise ValueError(msg)
   1147 
   1148             # datetimelikes must match exactly
ValueError: You are trying to merge on object and float64 columns. If you wish to proceed you should use pd.concat
ValueError: You are trying to merge on object and float64 columns. If you wish to proceed you should use pd.concat
