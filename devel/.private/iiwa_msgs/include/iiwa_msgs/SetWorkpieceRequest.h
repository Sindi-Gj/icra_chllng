// Generated by gencpp from file iiwa_msgs/SetWorkpieceRequest.msg
// DO NOT EDIT!


#ifndef IIWA_MSGS_MESSAGE_SETWORKPIECEREQUEST_H
#define IIWA_MSGS_MESSAGE_SETWORKPIECEREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace iiwa_msgs
{
template <class ContainerAllocator>
struct SetWorkpieceRequest_
{
  typedef SetWorkpieceRequest_<ContainerAllocator> Type;

  SetWorkpieceRequest_()
    : workpiece_id()  {
    }
  SetWorkpieceRequest_(const ContainerAllocator& _alloc)
    : workpiece_id(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _workpiece_id_type;
  _workpiece_id_type workpiece_id;





  typedef boost::shared_ptr< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetWorkpieceRequest_

typedef ::iiwa_msgs::SetWorkpieceRequest_<std::allocator<void> > SetWorkpieceRequest;

typedef boost::shared_ptr< ::iiwa_msgs::SetWorkpieceRequest > SetWorkpieceRequestPtr;
typedef boost::shared_ptr< ::iiwa_msgs::SetWorkpieceRequest const> SetWorkpieceRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator1> & lhs, const ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator2> & rhs)
{
  return lhs.workpiece_id == rhs.workpiece_id;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator1> & lhs, const ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace iiwa_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0157a464cf6d49c977a614271ab236bf";
  }

  static const char* value(const ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0157a464cf6d49c9ULL;
  static const uint64_t static_value2 = 0x77a614271ab236bfULL;
};

template<class ContainerAllocator>
struct DataType< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "iiwa_msgs/SetWorkpieceRequest";
  }

  static const char* value(const ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# This service allows to attach a workpiece to the robots tool.\n"
"# Setting a new workpiece automatically detaches the old one.\n"
"\n"
"# Id of Sunrise workpiece template. Leave emtpy to detach current workpiece.\n"
"string workpiece_id\n"
;
  }

  static const char* value(const ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.workpiece_id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetWorkpieceRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::iiwa_msgs::SetWorkpieceRequest_<ContainerAllocator>& v)
  {
    s << indent << "workpiece_id: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.workpiece_id);
  }
};

} // namespace message_operations
} // namespace ros

#endif // IIWA_MSGS_MESSAGE_SETWORKPIECEREQUEST_H
