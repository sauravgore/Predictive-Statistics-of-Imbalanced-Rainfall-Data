package Rain;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
//import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

public class RD implements Tool {
	
	Configuration conf;

	@Override
	public Configuration getConf() {
		// TODO Auto-generated method stub
		return conf;
	}

	@Override
	public void setConf(Configuration conf) {
		// TODO Auto-generated method stub
		this.conf=conf;
	}

	@Override
	public int run(String[] args) throws Exception {
		
		Job genderCountJob = new Job(conf);
		
		genderCountJob.setJobName("Assam");
		genderCountJob.setJarByClass(this.getClass());
		
		genderCountJob.setMapperClass(RM.class);
		
		
		genderCountJob.setNumReduceTasks(0);		
		
		
		genderCountJob.setMapOutputKeyClass(Text.class);
		
		genderCountJob.setMapOutputValueClass(NullWritable.class);
		
		
		genderCountJob.setInputFormatClass(TextInputFormat.class);
		
		genderCountJob.setOutputFormatClass(CsvOutputFormat.class);
		
		Path inputPath = new Path(args[0]);
		
		Path outputPath = new Path(args[1]);
		
		FileInputFormat.addInputPath(genderCountJob, inputPath);
		
		FileOutputFormat.setOutputPath(genderCountJob, outputPath);
		
		FileSystem fileSystem = outputPath.getFileSystem(conf);
		
		fileSystem.delete(outputPath, true);
		
		int result = genderCountJob.waitForCompletion(true)?0:-1;	
		
		return result;
	}
	
	public static void main(String[] args) throws Exception {
		
		int status = ToolRunner.run(new Configuration(), new RD(), args);
		
		System.out.println("Status : "+status);
		
	}

}